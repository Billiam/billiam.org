---
layout: post
title: "The $15 shift light and DiRT Rally"
date: 2015-07-02 11:10:14
comments: false
share: false
tags: []
image:
  feature: post/2015/tm1638/tm1638-banner.jpg
---

After some trial and error (_and error, and error, and error_), I've managed to get DiRT Rally telemetry data to
display on a TM1638 display module, and have released both the arduino sketch I'm using and the python script used for communication here: https://github.com/Billiam/pygauge

The python script is also available as an all-in-one exe. You can download `gauge.zip` [here](https://github.com/Billiam/pygauge/releases).

Here it is in use:
<iframe class="video" width="854" height="510" src="https://www.youtube.com/embed/C7DUk2SnzdM?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

I started with [X-Sim](http://x-sim.de/software.php?lang=eng) and [this guide](http://www.x-sim.de/forum/viewtopic.php?f=40&t=155), but ran into a few problems. X-sim required Dirt's extradata option to be set to 1, and didn't seem to be aware of each cars rev limit. In the linked guide, the rev limit has been hardcoded to 9,500, which is pretty far off of some of DiRT Rally's cars. The `Use automatic maximum adjustment` setting partially resolves this, but it won't know what the maximum rpm until you reach it at least once.

X-Sim is extremely flexible and powerful, but is very configuration-heavy and felt like overkill for this project. If you're already using X-Sim to drive your sim rig/gauges, I'd recommend sticking with it.

Additionally, if you're interested in using this LED module for other games, including Assetto Corsa, iRacing, Project Cars and rFactor, check out http://batrako.blogspot.com/ instead.

### Requirements:

You are going to need a few things:

* The TM1638 module: [dx.com $8.34](http://www.dx.com/p/8x-digital-tube-8x-key-8x-double-color-led-module-81873?Utm_rid=97796579&Utm_source=affiliate)
* An arduino. I'm using this one: [dx.com $7.84](http://www.dx.com/p/nano-v3-0-controller-module-for-arduino-works-with-official-arduino-boards-blue-383407?Utm_rid=97796579&Utm_source=affiliate) but I believe this one will work and is a bit cheaper as well: [dx.com $4.99](http://www.dx.com/p/new-nano-v3-0-module-atmega328p-au-improved-version-for-arduino-yellow-369070?Utm_rid=97796579&Utm_source=affiliate)
* _(optionally)_ Some jumper wires: [dx.com $2.96](http://www.dx.com/p/male-to-female-dupont-breadboard-jumper-wires-for-arduino-40-piece-pack-20cm-length-146935?Utm_rid=97796579&Utm_source=affiliate).  
I just soldered wires directly to the arduino pins, but if you plan to reuse your nano for something else in the future, this may be a better solution.

### Hardware setup

Connect the Arduino to your machine. You may need to install these drivers to recognize the USB serial device: http://www.ftdichip.com/Drivers/CDM/CDM%20v2.12.00%20WHQL%20Certified.zip

Install the Arduino software. Here is a helpful getting started guide: https://www.arduino.cc/en/Guide/Windows. Download the [TM1638 library](https://code.google.com/p/tm1638-library/) and extract the TM1638 directory to your Arduino library folder (ex: `C:\Program Files\Arduino\libraries`).

Verify that you can upload sketches by uploading the blinky light Arduino example (see guide link).

You will need to connect arduino pins to the LED module. One for ground, one for power, and 3 to control it. If you plan to daisy chain multiple modules, you'll be using additional pins.

Both the Arduino and the LED module pins are labeled on the PCB. Connect the Arduino 5v to the VCC input pin on the Arduino, connect ground to ground. I've wired Strobe 0, Clock and data to D3, D4 and D5 respectively.


<figure>
	<img src="{{site.url}}/images/post/2015/tm1638/wiring.jpg" alt="Figure displaying wiring arduino to TM1638 module" />
	<figcaption>
Wiring example from <a href="http://www.x-sim.de/forum/memberlist.php?mode=viewprofile&u=1437">Prodigy</a> in the x-sim forums.
	</figcaption>
</figure>


If the TM1638 library was installed correctly, you should have a TM1638 menu in the Arduino app under `File > Examples`. Upload the `tm1638_one_module_example` sketch to verify that you can communicate with the led module. You may need to update the data, clock and strobe pins used, depending on how you wired them together.

### Software setup

In your DiRT hardware configuration, `<Documents>\My Games\DiRT Rally\hardwaresettings\hardware_settings_config.xml`, set the motion element's `enabled` attribute to true and `extradata` to 3

```xml
<motion enabled="true" ip="127.0.0.1" port="20777" delay="1" extradata="3" />
```

Install [this sketch](https://raw.githubusercontent.com/Billiam/pygauge/master/arduino/tm1638-gauge.ino) on your Arduino. You may need to change the data, clock and strobe pin numbers, again depending on how you wired the led module up.

Download the [pygauge](https://github.com/Billiam/pygauge/releases) app, which will be responsible for passing telemetry data from DiRT Rally to the Arduino. 

Edit the included `config.yml` file, setting the `host` and `port` of DiRT Rally (likely 127.0.0.1 and 20777 if you've left everything default), and the COM port that your Arduino is connected to.

Launch the gauge app (either run the exe, or `python path/to/gauge.py`). You should see the Arduino reset.

That's about it. Load up DiRT Rally, and you should see the LED module react once your stage starts.

### Finishing up

* You may want to put the LED module in a project box of some kind. This will probably entail desoldering the ribbon cable connectors on the front of the module which stick out a fair bit.
* Carbon fiber everything
* Install fancy racing button box buttons for the LED module.
* Add new features and submit a pull request!

## tl;dr

1. Install Arduino sketch: https://github.com/Billiam/pygauge
2. Set DiRT's `extradata` to 3
3. Grab latest gauge.zip from https://github.com/Billiam/pygauge/releases
4. Update config.yml with your COM port, and dirt's IP address and port.
2. Run gauge.exe
3. Start game.
