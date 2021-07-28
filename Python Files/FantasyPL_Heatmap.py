import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


train_fwd = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPL_Data/2020-21/Correlation Heatmap Files/players_raw_FWD.csv')
train_def = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPL_Data/2020-21/Correlation Heatmap Files/players_raw_DEF.csv')
train_mid = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPL_Data/2020-21/Correlation Heatmap Files/players_raw_MID.csv')
train_gk = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPL_Data/2020-21/Correlation Heatmap Files/players_raw_GK.csv')

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_fwd.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_def.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_gk.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_mid.corr(), linewidth=.5)