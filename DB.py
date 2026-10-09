import pandas as pd
import sqlite3  
from pathlib import Path
Base_dir = Path(__file__).resolve().parent

TABLES={"bajaj_auto":"Bajaj_Auto.csv",
"eicher_motors": "Eicher_Motors.csv",
"hero_motocorp": "Hero_Motocorp.csv",
"infosys": "Infosys.csv",
"tcs": "TCS.csv",
"tvs_motors": "TVS_Motors.csv",}

RENAME = {
    "Date": "date",
    "Open Price": "open_price",
    "High Price": "high_price",
    "Low Price": "low_price",
    "Close Price": "close_price",
    "WAP": "wap",
    "No.of Shares": "no_of_shares",
    "No. of Trades": "no_of_trades",
    "Total Turnover (Rs.)": "total_turnover",
    "Deliverable Quantity": "deliverable_qty",
    "% Deli. Qty to Traded Qty": "pct_deli_qty",
    "Spread High-Low": "spread_high_low",
    "Spread Close-Open": "spread_close_open",
}
def build_db(data_dir=Base_dir / "data"):
    
    conn = sqlite3.connect(":memory:", check_same_thread=False)
    for table, fname in TABLES.items():
        path=Path(data_dir)/fname
        if not path.exists():
            raise FileNotFoundError(f"File {fname} not found in {data_dir}")    
        df = pd.read_csv(f"{data_dir}/{fname}").rename(columns=RENAME)
        
        # '1-January-2015' -> '2015-01-01' so text dates sort correctly
        df["date"] = pd.to_datetime(df["date"], format="%d-%B-%Y").dt.strftime("%Y-%m-%d")
        df.to_sql(table, conn, index=False)
        
    return conn
# if __name__ == "__main__":
#     # demo.py
#     print("__name__ is:", __name__)
#     conn = build_db()
#     print(conn.execute("Select * from bajaj_auto limit 5").fetchall())


