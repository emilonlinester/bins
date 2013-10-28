bins
====

Small programs for every day use

  - genmon-cpuinfo.sh is helper script for xfce4-genmon-plugin to display CPU temperature and frequency in xfce4 panel.

Prerequisites
-------------
You need to have installed [xfce4-genmon-plugin](http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin)

Installing
----------`
Place the script in your path.

```bash
sudo cp genmon-cpuinfo.sh /usr/local/bin
```

Then add new "Generic Monitor" element to your xfce4 panel
and configure it with command 'genmon-cpuinfo.sh' and period of 10 seconds.

