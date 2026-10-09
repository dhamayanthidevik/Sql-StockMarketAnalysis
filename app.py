import pandas as pd
import streamlit as st
from DB import build_db, TABLES

st.set_page_config(page_title="SQL Stock Market Playground", layout="wide")


@st.cache_resource
def get_conn():
    
    return build_db("data")


conn = get_conn()

# Checkpoints taken from the student guide ("Check yourself" boxes)
CHECKS = {
    "Task 1: history of bajaj_auto": lambda df: (
        df.shape == (1, 3) and int(df.iloc[0, 0]) == 889
        and df.iloc[0, 1] == "2015-01-01" and df.iloc[0, 2] == "2018-07-31"),
    "Task 2: Eicher's five best closes":lambda df: (len(df) == 5 and 
        list(df.columns) == ["date", "close_price"] and float(df.iloc[0,1]) > 32000 and
        float(df.iloc[0,1]) == float(df["close_price"].max())),
    "Task 3: TCS year by year": lambda df: (
        len(df) == 4 and list(df.iloc[:, 0].astype(str)) == ["2015", "2016", "2017", "2018"]
        and abs(float(df.iloc[1, 1]) - 2419.00) < 0.005),
    "Task 4: find the holes": lambda df: len(df) == 6,
    "Task 5: bajaj1 (moving averages)": lambda df: (
        df.shape == (889, 4) and list(df.columns) == ["date", "close_price", "ma20", "ma50"]
        and df.dropna(subset=["ma20"]).iloc[0]["date"] == "2015-01-29"
        and abs(df.dropna(subset=["ma20"]).iloc[0]["ma20"] - 2415.53) < 0.005
        and df.dropna(subset=["ma50"]).iloc[0]["date"] == "2015-03-13"
        and abs(df.dropna(subset=["ma50"]).iloc[0]["ma50"] - 2283.80) < 0.005),
        "Task 6: master_table": lambda df: (
        df.shape == (889, 7)
        and list(df.columns) == ["date", "bajaj", "tcs", "tvs", "infosys", "eicher", "hero"]
        and not df.isnull().values.any()
        and (abs(df[df["date"] == "2018-07-31"]["bajaj"].astype(float) - 2700.70) < 0.005).any()
        and (abs(df[df["date"] == "2018-07-31"]["tvs"].astype(float) - 517.45) < 0.005).any()),
    "Task 7: bajaj2 (signals)": lambda df: (
        df.shape == (889, 3)
        and df[df.iloc[:, 2] == "Buy"]["date"].min() == "2015-05-18"
        and df[df.iloc[:, 2] == "Sell"]["date"].min() == "2015-08-24"),
    "Task 8: signal counts": lambda df: (
        len(df) == 3 and int(df.iloc[:, 1].sum()) == 889
        and dict(zip(df.iloc[:, 0], df.iloc[:, 1])).get("Buy") == 12
        and dict(zip(df.iloc[:, 0], df.iloc[:, 1])).get("Sell") == 11),
    "Task 9: signal on a given day": lambda df: (
        df.shape == (1, 1)
        and df.iloc[0, 0] in ("Buy", "Sell", "Hold")),
    "Task 10: all six stocks": lambda df: (
        len(df) == 6
        and list(df.columns) == ["stock", "buys", "sells", "last_signal_date", "last_signal"]
        and list(df["stock"]) == ["Bajaj Auto", "Eicher Motors", "Hero Motocorp",
                                  "Infosys", "TCS", "TVS Motors"]
        and int(df["buys"].sum()) == 56 and int(df["sells"].sum()) == 57),
    "Task 11: who went up": lambda df: (
        len(df) == 6 and str(df.iloc[0, 0]).lower().startswith("tvs")
        and abs(float(df.iloc[0, -1]) - 86.9) < 0.05),
    "Task 12: the data trap": lambda df: (
        len(df) == 6
        and list(df.columns) == ["stock", "date", "close_price", "pct_move"]
        and df["pct_move"].astype(float).is_monotonic_increasing      # worst first
        and (df["pct_move"].astype(float).iloc[:2] < -30).all()       # the two cliffs
        and (df["pct_move"].astype(float).iloc[2:].between(-15, -5)).all()
        and {str(s).lower() for s in df["stock"].iloc[:2]} == {"tcs", "infosys"}),
    "Task 13: fix it": lambda df: (
        len(df) == 2
        and list(df.columns) == ["stock", "adjusted_pct_change"]
        and [str(s).lower() for s in df.iloc[:, 0]] == ["infosys", "tcs"]
        and df.iloc[:, 1].astype(float).notna().all()),
}

with st.sidebar:
    st.header("Tables")
    for t in TABLES:
        with st.expander(t):
            cols = pd.read_sql_query(f"PRAGMA table_info({t})", conn)
            st.write(", ".join(cols["name"]))
    st.caption("Tables you create (e.g. bajaj1) appear here after a rerun.")
    extra = pd.read_sql_query(
        "SELECT name FROM sqlite_master WHERE type='table'", conn)["name"].tolist()
    extra = [n for n in extra if n not in TABLES]
    if extra:
        st.subheader("Your tables")
        for n in extra:
            st.write(n)
    if st.button("Reset database"):
        st.cache_resource.clear()
        st.rerun()

st.title("SQL Stock Market Playground")
st.caption("SQLite in memory: six NSE stocks, Jan 2015 to Jul 2018. "
           "Use strftime('%Y', date) for the year. Port to MySQL for submission.")

query = st.text_area("Write your SQL", height=260,
                     value="SELECT * FROM bajaj_auto LIMIT 5;")
c1, c2 = st.columns([1, 3])
run = c1.button("Run", type="primary")
task = c2.selectbox("Check against a task (optional)", ["None"] + list(CHECKS))

if run:
    try:
        # split into statements; run all, show the result of the last SELECT
        statements = [s.strip() for s in query.split(";") if s.strip()]
        result = None
        for s in statements:
            cur = conn.execute(s)
            if cur.description:
                result = pd.DataFrame(cur.fetchall(),
                                      columns=[d[0] for d in cur.description])
        conn.commit()
        if result is None:
            st.success("Statements ran. Run SELECT * FROM your_table; to see it.")
        else:
            st.session_state["result"] = result
    except Exception as e:
        st.session_state.pop("result", None)
        st.error(f"SQL error: {e}")

result = st.session_state.get("result")
if result is not None:
    st.write(f"{len(result)} rows, {len(result.columns)} columns")
    if task != "None":
        try:
            ok = CHECKS[task](result)
        except Exception:
            ok = False
        (st.success if ok else st.error)(
            "Matches the checkpoints." if ok else
            "Not matching yet. Re-read the Check yourself and Common mistakes boxes.")
    view = st.radio("View", ["Table", "Chart"], horizontal=True)
    if view == "Table":
        st.dataframe(result, width="stretch")
    else:
        num = result.select_dtypes("number")
        if "date" in result.columns and not num.empty:
            st.line_chart(result.set_index("date")[num.columns])
        elif not num.empty:
            st.bar_chart(result.set_index(result.columns[0])[num.columns])
        else:
            st.info("Nothing numeric to chart.")