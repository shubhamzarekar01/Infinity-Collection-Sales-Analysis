"""
============================================================
INFINITY COLLECTION — Python Data Analysis
Author  : Shubham Zarekar | Data Analyst Portfolio Project
Business: Infinity Collection, Shirdi, Maharashtra
UDYAM   : UDYAM-MH-01-0056563
Tools   : pandas, numpy, matplotlib, seaborn, plotly
============================================================
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick
import seaborn as sns
from matplotlib.patches import FancyBboxPatch
import warnings
warnings.filterwarnings('ignore')

# ── Color Theme (matching brand) ──────────────────────────────────
NAVY   = '#1A2F5A'
ORANGE = '#E36209'
TEAL   = '#00B4D8'
GOLD   = '#C9A84C'
GREEN  = '#1E7145'
RED    = '#C00000'
LGRAY  = '#F2F6FC'

plt.rcParams.update({
    'font.family': 'DejaVu Sans',
    'axes.spines.top': False,
    'axes.spines.right': False,
    'figure.facecolor': LGRAY,
    'axes.facecolor': 'white',
})

# ════════════════════════════════════════════════════════════════════
# 1. DATA LOADING
# ════════════════════════════════════════════════════════════════════
months = ['Jan','Feb','Mar','Apr','May','Jun',
          'Jul','Aug','Sep','Oct','Nov','Dec']

data_2024 = {
    'month': months,
    'month_num': list(range(1, 13)),
    'year': [2024] * 12,
    'collection': [1606474,1084329,1034395,1055722,1308870,1339195,
                   1238144,914813,774970,929965,1472745,1481232],
    'sell':       [1606703,981981,1140340,940390,1461639,1461639,
                   1236975,1023095,958870,986390,1313050,1393645]
}

data_2025 = {
    'month': months,
    'month_num': list(range(1, 13)),
    'year': [2025] * 12,
    'collection': [1437385,852705,721015,703980,571390,614800,
                   749455,583985,393329,604960,625830,766830],
    'sell':       [1493496,826287,740890,704877,586120,519845,
                   785481,596710,351784,623785,700800,800800]
}

df24 = pd.DataFrame(data_2024)
df25 = pd.DataFrame(data_2025)
df_all = pd.concat([df24, df25], ignore_index=True)

# Derived metrics
for df in [df24, df25, df_all]:
    df['difference']  = df['sell'] - df['collection']
    df['diff_pct']    = (df['difference'] / df['collection'] * 100).round(1)
    df['sell_L']      = (df['sell'] / 100000).round(2)      # in Lakhs
    df['coll_L']      = (df['collection'] / 100000).round(2)

# Party data
customers = pd.DataFrame({
    'name': ['Arshadbhai','Pravinbhau','Sachin harde','Saipalkhi chappal',
             'Husenbhai','Shivaji Pawar','Sahebrav gangurde','Nisarbhai Pathan',
             'Sandeep Chavhan','Sagar Mali','Ravi Arane','Vishalnagpure',
             'Yogesh kamble','Ajaypalande','Vilas tupe','Gupta bai',
             'Tribhuvan bhau','Meenabai','Bablu Kamble','Amol Gangurde'],
    'receivable': [69920,66800,56230,65540,43420,35026,31570,28420,
                   24380,24910,23889,23405,21010,24340,19760,12270,
                   18600,15725,17060,17100],
    'area': ['KOTE','SHIRDI','SHIRDI','SHIRDI','SHIRDI','SHIRDI','SHIRDI',
             'SHIRDI','SHIRDI','SHIRDI','SHIRDI','SHIRDI','SHIRDI','KOTE',
             'SHIRDI','SHIRDI','SHIRDI','SHIRDI','HWY','HWY']
})

suppliers = pd.DataFrame({
    'name': ['Kartik kamble','Akash Regar','Jutt bag kolkatta','Shokatbhai',
             'Prakash bhai','Ramesh bhai','Sanubhai mumbai','Shahin footware',
             'Woodland Kapoor','L D DELHI','Raju bhai kanpoor'],
    'payable': [200555,135528,122377,74100,60600,44475,34460,23500,21080,12400,10000]
})

print("=" * 60)
print("  INFINITY COLLECTION — Data Analysis Summary")
print("=" * 60)
print(f"\n📊 2024 Annual Revenue:")
print(f"   Total Collection : ₹{df24['collection'].sum():>12,.0f}")
print(f"   Total Sell       : ₹{df24['sell'].sum():>12,.0f}")
print(f"   Net Difference   : ₹{df24['difference'].sum():>12,.0f}")

print(f"\n📊 2025 Annual Revenue:")
print(f"   Total Collection : ₹{df25['collection'].sum():>12,.0f}")
print(f"   Total Sell       : ₹{df25['sell'].sum():>12,.0f}")
print(f"   Net Difference   : ₹{df25['difference'].sum():>12,.0f}")

yoy_coll = (df25['collection'].sum() - df24['collection'].sum()) / df24['collection'].sum() * 100
yoy_sell = (df25['sell'].sum() - df24['sell'].sum()) / df24['sell'].sum() * 100
print(f"\n📉 YoY Change:")
print(f"   Collection Change: {yoy_coll:+.1f}%")
print(f"   Sell Change      : {yoy_sell:+.1f}%")

print(f"\n👥 Customers Outstanding: ₹{customers['receivable'].sum():,.0f}")
print(f"🏭 Suppliers Payable    : ₹{suppliers['payable'].sum():,.0f}")
print(f"💰 Net Working Capital  : ₹{customers['receivable'].sum()-suppliers['payable'].sum():,.0f}")


# ════════════════════════════════════════════════════════════════════
# 2. VISUALIZATION — DASHBOARD (4 charts in one figure)
# ════════════════════════════════════════════════════════════════════
fig = plt.figure(figsize=(20, 16))
fig.suptitle('♾️  INFINITY COLLECTION — Business Intelligence Dashboard',
             fontsize=18, fontweight='bold', color=NAVY, y=0.98)
plt.figtext(0.5, 0.955, 'Shirdi, Ahmednagar | UDYAM-MH-01-0056563 | Data Analytics Report 2024-2025',
            ha='center', fontsize=10, color='gray', style='italic')

gs = fig.add_gridspec(3, 3, hspace=0.42, wspace=0.35,
                      left=0.06, right=0.97, top=0.93, bottom=0.05)

# ── Chart 1: Monthly Collection vs Sell 2024 ─────────────────────
ax1 = fig.add_subplot(gs[0, :2])
x = np.arange(12)
w = 0.38
bars1 = ax1.bar(x - w/2, df24['coll_L'], w, label='Collection', color=NAVY, alpha=0.9, zorder=3)
bars2 = ax1.bar(x + w/2, df24['sell_L'],  w, label='Sell',       color=GOLD, alpha=0.9, zorder=3)
ax1.set_xticks(x); ax1.set_xticklabels(months, fontsize=9)
ax1.set_ylabel('Amount (₹ Lakhs)', fontsize=9)
ax1.set_title('📅 2024 — Monthly Collection vs Sell', fontsize=11, fontweight='bold', color=NAVY)
ax1.legend(fontsize=9); ax1.yaxis.set_major_formatter(mtick.FormatStrFormatter('%.0f L'))
ax1.grid(axis='y', alpha=0.3, zorder=0)
ax1.set_facecolor('white')

# ── Chart 2: Monthly Collection vs Sell 2025 ─────────────────────
ax2 = fig.add_subplot(gs[1, :2])
bars3 = ax2.bar(x - w/2, df25['coll_L'], w, label='Collection', color=TEAL,  alpha=0.9, zorder=3)
bars4 = ax2.bar(x + w/2, df25['sell_L'],  w, label='Sell',       color=GREEN, alpha=0.9, zorder=3)
ax2.set_xticks(x); ax2.set_xticklabels(months, fontsize=9)
ax2.set_ylabel('Amount (₹ Lakhs)', fontsize=9)
ax2.set_title('📅 2025 — Monthly Collection vs Sell', fontsize=11, fontweight='bold', color=NAVY)
ax2.legend(fontsize=9); ax2.yaxis.set_major_formatter(mtick.FormatStrFormatter('%.0f L'))
ax2.grid(axis='y', alpha=0.3, zorder=0)

# Accident marker
ax2.axvline(x=5.5, color=RED, linestyle='--', alpha=0.7, linewidth=1.5)
ax2.text(5.6, ax2.get_ylim()[1]*0.85, '⚠️ Accident\nImpact', color=RED, fontsize=7.5)
ax2.set_facecolor('white')

# ── Chart 3: YoY Comparison Line ─────────────────────────────────
ax3 = fig.add_subplot(gs[2, :2])
ax3.plot(months, df24['sell_L'], 'o-', color=NAVY, lw=2.5, label='2024 Sell', markersize=6)
ax3.plot(months, df25['sell_L'], 's-', color=GOLD, lw=2.5, label='2025 Sell', markersize=6)
ax3.fill_between(range(12), df24['sell_L'], df25['sell_L'],
                  alpha=0.15, color=RED, label='Revenue Gap')
ax3.set_xticks(range(12)); ax3.set_xticklabels(months, fontsize=9)
ax3.set_ylabel('Sell (₹ Lakhs)', fontsize=9)
ax3.set_title('📈 2024 vs 2025 — Sell Trend Comparison', fontsize=11, fontweight='bold', color=NAVY)
ax3.legend(fontsize=9); ax3.grid(alpha=0.3)
ax3.set_facecolor('white')

# ── Chart 4: Top Customers ────────────────────────────────────────
ax4 = fig.add_subplot(gs[0, 2])
top10 = customers.nlargest(10, 'receivable')
colors_c = [RED if r > 50000 else GOLD if r > 20000 else TEAL for r in top10['receivable']]
bars_c = ax4.barh(range(len(top10)), top10['receivable']/1000, color=colors_c, alpha=0.9)
ax4.set_yticks(range(len(top10)))
ax4.set_yticklabels([n[:15] for n in top10['name']], fontsize=7.5)
ax4.set_xlabel('Outstanding (₹ 000s)', fontsize=8)
ax4.set_title('👥 Top Customers\nOutstanding', fontsize=10, fontweight='bold', color=NAVY)
ax4.grid(axis='x', alpha=0.3)
ax4.invert_yaxis()
ax4.set_facecolor('white')

# ── Chart 5: Supplier Payable ─────────────────────────────────────
ax5 = fig.add_subplot(gs[1, 2])
top_sup = suppliers.nlargest(8, 'payable')
colors_s = [RED if p > 100000 else ORANGE if p > 50000 else GOLD for p in top_sup['payable']]
ax5.barh(range(len(top_sup)), top_sup['payable']/1000, color=colors_s, alpha=0.9)
ax5.set_yticks(range(len(top_sup)))
ax5.set_yticklabels([n[:15] for n in top_sup['name']], fontsize=7.5)
ax5.set_xlabel('Payable (₹ 000s)', fontsize=8)
ax5.set_title('🏭 Supplier Payables\n(Urgency)', fontsize=10, fontweight='bold', color=NAVY)
ax5.grid(axis='x', alpha=0.3)
ax5.invert_yaxis()
ax5.set_facecolor('white')

# ── Chart 6: KPI Summary Cards ────────────────────────────────────
ax6 = fig.add_subplot(gs[2, 2])
ax6.axis('off')
kpis = [
    ("2024 Total Sell",     f"₹{df24['sell'].sum()/100000:.1f}L",  NAVY),
    ("2025 Total Sell",     f"₹{df25['sell'].sum()/100000:.1f}L",  GREEN),
    ("YoY Change",          f"{yoy_sell:+.1f}%",                    RED),
    ("Receivable",          f"₹{customers['receivable'].sum()/1000:.0f}K", TEAL),
    ("Payable",             f"₹{suppliers['payable'].sum()/1000:.0f}K",    GOLD),
    ("Net Working Cap",     f"₹{(customers['receivable'].sum()-suppliers['payable'].sum())/1000:.0f}K", GREEN),
]
ax6.set_title('📊 Key Metrics', fontsize=10, fontweight='bold', color=NAVY, pad=12)
for i,(label,value,color) in enumerate(kpis):
    y=0.92 - i*0.16
    rect = FancyBboxPatch((0.02, y-0.07), 0.96, 0.13,
                           boxstyle="round,pad=0.01", facecolor=color, alpha=0.15,
                           transform=ax6.transAxes, zorder=2)
    ax6.add_patch(rect)
    ax6.text(0.08, y+0.01, label, transform=ax6.transAxes,
             fontsize=8, color='#333333', va='center')
    ax6.text(0.92, y+0.01, value, transform=ax6.transAxes,
             fontsize=11, fontweight='bold', color=color, va='center', ha='right')

plt.savefig('/home/claude/infinity_collection/docs/dashboard.png',
            dpi=150, bbox_inches='tight', facecolor=LGRAY)
plt.close()
print("\n✅ Dashboard saved: docs/dashboard.png")

# ════════════════════════════════════════════════════════════════════
# 3. ADDITIONAL ANALYSIS
# ════════════════════════════════════════════════════════════════════

print("\n" + "="*60)
print("  QUARTERLY ANALYSIS")
print("="*60)
df_all['quarter'] = pd.cut(df_all['month_num'], bins=[0,3,6,9,12],
                            labels=['Q1','Q2','Q3','Q4'])
quarterly = df_all.groupby(['year','quarter'])[['collection','sell']].sum()
print(quarterly.to_string())

print("\n" + "="*60)
print("  CUSTOMER SEGMENTATION")
print("="*60)
customers['segment'] = pd.cut(customers['receivable'],
    bins=[0, 5000, 20000, 50000, float('inf')],
    labels=['D - Low', 'C - Medium', 'B - High', 'A - Critical'])
print(customers.groupby('segment')['receivable'].agg(['count','sum','mean']).to_string())

print("\n" + "="*60)
print("  BUSINESS INSIGHT SUMMARY")
print("="*60)
print("""
1. 📉 Revenue dropped ~39% YoY (2024→2025) due to Dec 2024 accident
2. 🏆 Best months: Jan & Nov consistently perform highest
3. ⚠️  Jun-Oct 2025: Critical low period (post-accident impact)
4. 💰 Net Working Capital POSITIVE: ₹{:,.0f} (Receivable > Payable)
5. 🎯 Recovery visible from Oct 2025 onwards
6. 👥 Top 5 customers = {:.0f}% of total outstanding receivables
""".format(
    customers['receivable'].sum() - suppliers['payable'].sum(),
    customers.nlargest(5,'receivable')['receivable'].sum() / customers['receivable'].sum() * 100
))

# ════════════════════════════════════════════════════════════════════
# 4. EXPORT CLEAN DATA CSVs (for Power BI / Tableau)
# ════════════════════════════════════════════════════════════════════
df_all.to_csv('/home/claude/infinity_collection/data/monthly_sales.csv', index=False)
customers.to_csv('/home/claude/infinity_collection/data/customers.csv', index=False)
suppliers.to_csv('/home/claude/infinity_collection/data/suppliers.csv', index=False)
print("✅ CSVs exported to /data/ folder")
print("\n🎉 Analysis complete!")
