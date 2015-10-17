# COSTA RICA INSTITUTE OF TECHNOLOGY
- **Computer Engineering**

- **Programming Languages, Compilers and Interpreters**


- **Proyecto #1 - ​Temporalizador Led**

- **Project by: Roberto Bonilla and Pablo Rodríguez**







##Introduction
The tecnology has grown at big steps, mainly in the middle of computer science and electonical engineering. Therefore is useful to develop creative elements and ingeneous that allow us to walk together with this creations and improve our creativity.

##Problem Description
The project consists in a LED temporizer that has 4 modes. It blinks the lights making the patterns. It is implemented in a microcontroller Attiny85 using AVR ASM.

##Development Environment
- Atmel Studio 7
- AVRDude
- AVRA
- GitHub

##Alternative Solutions
We tought using the Atmega328p but we didnt use it because it was a simple and ligthweight problem. And a atmega is more powerful and unnecessary. So we choose the attiny85, it also is cheaper and simpler. With one port you can do everything.

##Program design
The algorithm for the leds is based on a auxiliar PORTB register so we change the bit of that. Using CPI to compare when the led has compared the limit of the bit we restart the counter. Alternating between left shift and right shift. When changing the mode we change the limit.
While doing the delay the button state is read and if the button is pressed the flag T is raised and  the mode is changed. The delay algorithms just uses 3 registers to do arithmetic operations decreasing by one. the Time is variable depending of the mode.

##Hardware description
Materials:
- ATTiny85
- 6 green LED
- 6 red LED
- 42 yellow LED
- 1 kiloohm resistor
- 330 ohm resistor
- 1 Button
- 5 volt voltage source

Three green LED, three red LED and three yellow LED are connected in parallel to create the two flags. Twenty one yellow LED are connected in parallel to create the C letter. Twenty three yellow LED are connected in parallel to create the E letter. These four arrays are connected in parallel between the microcontroller and the 330 ohm resistor that goes to the ground. The button is connected to the 10 kiloohm resistor that comes from the voltage source, the microcontroller is connected on the same node to allow lectures. The button is also connected to ground. The voltage source and the ground are also connected to the microcontroller.

##Project final status
The project works at its 100 percent.

##Issues Found
- Issue: series connected LED's instensity is almost null.
- Solution: connect them in parallel.
- Issue: a LED is turned off.
- Solution: check it, if is damaged change it, if isn't find the lost connection to weld it again.

##Conclusions
- LEDs have to be connected un parallel to generate the same voltage, because in series the voltage decreases.
- Microcontrollers are a good tool for simple and small circuits.
- Assembly is harder but more powerful.

##Suggestions and recommendations
- If you are going to weld use gloves and glasses.
- Be sure you are welding the definitive circuit.
- Be sure you are welding undamaged components.
- Buy a little more components than you need because it's easy to burn them.

##Student's Activity Log

Chart 1. Roberto Bonilla's timesheet.

| Activity                    |Time(h)|
|:---------------------------:|:-----:|
| Planning                    |   2   |
| Reaserch                    |   1   |
| Buying components           |   1   |
| Welding components          |   5   |
| Unwelding components        |   1   |
| Welding components          |   5   |
| Tests                       |  0.08 |
| Replacing leds              |  0.3  |
| Tests                       |  0.25 |
| Writing documentation       |   2   |

Chart 2. Pablo Rodriguez's timesheet.

| Activity                    | Time(h) | Description |
|:---------------------------:|:-------:|:-----------:|
| Planning                    |    2h   | Meeting with Roberto |
| Researching              	   |    1h   | Researching on the Internet and with the tutors|
| Writing code                |    5h   | Making the assembler code |
| Writing code                |    4h   | Debugging the button |
| Writing documentation       |    2h   | Internal Documentation and External |

## References

