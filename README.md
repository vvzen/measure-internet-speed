# measure-internet-speed
Minimalistic bash + python code to monitor your internet connection and make pretty graphs without effort.

- If you want to make something fancier, realtime, etc.. use Graphana instead: https://github.com/grafana/grafana
- If you'd rather just have something minimal, terminal and collect data over time in a no-frills tabular format, for later analysis, then this repo might be good enough

## monitor_speed.sh
Uses `speedtest-cli` to spit out a daily csv with the result of a speed test (ping, upload/down speeds, info on the remote used for the test)
Sending to background `speedtest-cli` (ctrl+z) didn't work in my case, it has to do with how it's written probably. To run it continuously I recommend just runnig it from a tmux session and then detaching from it.

The speed test interval can be changed via the `interval` variable, expressed in seconds.

Other alternatives are to use a cronjobs, etc.. but I don't particularly them.

The script should work in any POSIX compliant shell, but I only tested with GNU bash  3.2.57(1)
If you're a fellow `fish` user, you'll want to use `monitor_speed.fish` instead.

## internet_speed_exploration.ipynb
Ipython notebook using pands and matplotlib to create the super simple time based charts.

### Python Requirements

The good old triad:
- `pandas`
- `matplotlib`
- `jupyterlab`

If you're not familiar with python and its package management, have a read online with how virtual-envs works, before randomly trying to install stuff and pollute your system level PYTHONPATH.

I've also added a conda `environment.yml` freezing the versions of these dependencies that have been working fine for me. If you have no clue about conda, I wrote a (high-level) article here: https://www.valerioviperino.me/conda/for-pipeline-tds
