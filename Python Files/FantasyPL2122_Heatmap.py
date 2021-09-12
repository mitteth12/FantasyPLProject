import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


train_fwd = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPLProject/Correlation Heatmap Files/players_raw_currentFWD.csv')
train_def = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPLProject/Correlation Heatmap Files/players_raw_currentDEF.csv')
train_mid = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPLProject/Correlation Heatmap Files/players_raw_currentMID.csv')
train_gk = pd.read_csv('/Users/ethanmitten/Desktop/Data Analytics/Fantasy PL Project/FantasyPLProject/Correlation Heatmap Files/players_raw_currentGK.csv')

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_fwd.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_def.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_gk.corr(), linewidth=.5)

f, ax = plt.subplots(figsize=(14,14))
sns.heatmap(train_mid.corr(), linewidth=.5)

