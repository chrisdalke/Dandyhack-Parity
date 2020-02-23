# Parity: DandyHacks 2016 Project
## Summary

Parity created novel ways to generate sound through unique hardware/software instruments. Our team built a variety of hardware and software instruments in 36 hours as part of the DandyHacks 2016 hackathon, the third annual computer science hackathon held at the University of Rochester. [More info on the Hajim School of Engineering website.](http://www.hajim.rochester.edu/news/2016-04-21_dandyhacks.html) __Our team won 2nd place overall at the hackathon out of over 50 teams.__

We built:
- A set of giant glowing piano keys connected to a visualization and synthesizer
- A theremin shirt which generated tones based on the position of the users' hands relative to the shirt buttons.
- A keyboard glove which could be manipulated to play chords based on finger positions.

## What's Here

This repository focuses on the piano keys, which were my contribution to the project. The repository contains the synthesizer code, as well as some images of the project.

## Pictures
![Picture 3](/Images/picture3.jpg)
![Picture 2](/Images/picture2.jpg)

## Notes

When I started the hackathon, I decided I wanted to tackle a hardware/software hack. I decided on building a large keyboard-input device that would be pressable using your hands or feet, and would send input to a computer. 

This idea was influenced by a project that a Microsoft team did at one of their BUILD Developer conferences: https://www.youtube.com/watch?v=eU39xbaPvz8

I chose to use an Arduino and communicate with the PC over a USB-Serial connection.

The original intention was to build a custom driver that could map each key to any key press, allowing you to control virtually any application from the piano keys! Because of time restrictions I narrowed the scope of my project so the device inputted number key presses which were used by a music synthesizer and visualization built using Processing.

I started the project by building wooden & acrylic pads for each key. Because of time restrictions I wasn't able to order piezo elements (For use as pressure sensors) online, so I bought piezo buzzers from a local RadioShack and cracked them open to extract the element.

I then built each key, putting colored LED strips and a piezo element under a piece of plexiglass that I frosted using a sander. I interconnected all the keys using a bundle of wires which connected to a single arduino which controlled the whole system. The arduino monitored the voltage from each piezo element, sending a signal if any of the elements went over the threshold that indicated they were being pressed or tapped.

Finally, I built the visualization and synthesizer using Processing. The software read the USB-Serial input and had multiple advanced features; looping, layering, multiple instruments were all included in the project.

