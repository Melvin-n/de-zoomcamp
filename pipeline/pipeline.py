import sys
import pandas as pd

# note first arg is the name of the script
month = int(sys.argv[1])


df = pd.DataFrame({"day": [1, 2], "num_passengers": [3, 4]})
df['month'] = month


print(df.head())

df.to_parquet(f"output_{month}.parquet")
