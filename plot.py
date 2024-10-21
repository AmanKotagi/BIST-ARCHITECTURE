# import matplotlib.pyplot as plt
# import numpy as np

# # Data for BIST Modules
# modules = ['LFSR', 'BSLFSR', 'CFSR', 'BSCFSR']

# # Values for each module
# # total_area = [2524.261, 2867.137, 2600.708, 2914.822]
# # static_power = [10714.955, 12798.578, 11052.570, 12809.842]
# # dynamic_power = [78047.459, 122876.580,  83656.301, 126954.438]
# # total_power = [88762.414,  135675.157,   94708.871 , 139764.280]
# # leaf_instance_count = [395, 404, 411, 429]
# pathdelay= [951,968,1050,1365]
# Required_time= [4792,4740,4796,4697]
# Slack=[3841,3772,3745,3332]

# # Function to plot a bar chart
# def plot_bar_chart(values, title, ylabel):
#     plt.figure(figsize=(8, 6))
#     bars = plt.bar(modules, values, color=['blue', 'red', 'orange', 'green'])
#     plt.title(title)
#     plt.xlabel('BIST Modules')
#     plt.ylabel(ylabel)
    
#     # Adding the values on top of the bars
#     for bar in bars:
#         yval = bar.get_height()
#         plt.text(bar.get_x() + bar.get_width()/2, yval, round(yval, 2), ha='center', va='bottom')

#     plt.show()

# # Plotting the charts
# # plot_bar_chart(total_area, 'Total Area Comparison', 'Total Area (units)')
# # plot_bar_chart(static_power, 'Static Power Comparison', 'Static Power (nW)')
# # plot_bar_chart(dynamic_power, 'Dynamic Power Comparison', 'Dynamic Power (nW)')
# # plot_bar_chart(total_power, 'Total Power Comparison', 'Total Power (nW)')
# # plot_bar_chart(leaf_instance_count, 'Leaf Instance Count Comparison', 'Leaf Instance Count')
# plot_bar_chart(pathdelay, 'DATAPATH DELAY', 'path delay ps')
# plot_bar_chart(Required_time,'REQUIRED TIME','Required time ps')
# plot_bar_chart(Slack,'SLACK','Slack ps')
import matplotlib.pyplot as plt
import numpy as np

# Data for BIST Modules
modules = ['LFSR', 'BSLFSR', 'CFSR', 'BSCFSR']

# Values for each module
pathdelay = [951.25, 968.50, 1050.75, 1365.10]
Required_time = [4792.60, 4740.45, 4796.85, 4697.20]
Slack = [3841.15, 3772.80, 3745.90, 3332.50]

# Function to plot a bar chart with color intensity
def plot_bar_chart(values, title, ylabel):
    plt.figure(figsize=(8, 6))
    
    # Normalize values for color intensity
    max_value = max(values)
    colors = [(0.5, 0.8, 0.7, value / max_value) for value in values]  # Blue color with varying intensity
    
    # Creating bars with the calculated colors
    bars = plt.bar(modules, values, color=colors)
    plt.title(title)
    plt.xlabel('BIST Modules')
    plt.ylabel(ylabel)
    
    # Adding the values on top of the bars with decimal formatting
    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2, yval, f"{yval:.2f}", ha='center', va='bottom')

    plt.tight_layout()
    plt.show()

# Plotting the charts
plot_bar_chart(pathdelay, 'DATAPATH DELAY', 'Path Delay (ps)')
plot_bar_chart(Required_time, 'REQUIRED TIME', 'Required Time (ps)')
plot_bar_chart(Slack, 'SLACK', 'Slack (ps)')
