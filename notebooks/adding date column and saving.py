import pandas as pd

df = pd.read_csv(r'C:\Users\user\Desktop\datasets\Mobile Payments.csv')
df

df['Date'] = pd.to_datetime(df['Year'].astype(str) + '-' + df['Month'] 
+ '-01')

df.to_csv("Mobile_Payment_Cleaned.csv", index = False)
