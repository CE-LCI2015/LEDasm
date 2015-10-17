# COSTA RICA INSTITUTE OF TECHNOLOGY

- **Computer Engineering**

- **Programming Languages, Compilers and Interpreters**

- **Proyecto #1 - ​Temporalizador Led**

- **Project by: Roberto Bonilla and Pablo Rodríguez**







##Introduction
The tecnology has grown at big steps, mainly in the middle of computer science and electonical engineering. Therefore is useful to develop creative elements and ingeneous that allow us to walk together with this creations and improve our creativity.
##Problem Description
The project consists in a LED temporizer that has 4 modes. It blinks the lights making the patterns. It is implemented in a microcontroller Attiny85 using AVR ASM.
##Development environment

- Atmel Studio 7
- AVRDude
- AVRA
- GitHub
##Alternative Solutions
We tought using the Atmega328p but we didnt use it because it was a simple and ligthweight problem. And a atmega is more powerful and unnecessary. So we choose the attiny85, it also is cheaper and simpler. With one port you can do everything.
##Program design
The algorithm for the leds is based on a auxiliar PORTB register so we change the bit of that. Using CPI to compare when the led has compared the limit of the bit we restart the counter. Alternating between left shift and right shift. When changing the mode we change the limit.
While doing the delay the button state is read and if the button is pressed the flag T is raised and  the mode is changed. The delay algorithms just uses 3 registers to do arithmetic operations decreasing by one. the Time is variable depending of the mode.

##Project final status
The project works at its 100 percent.

##Conclusions


##Suggestions and recommendations


## Student's Activity Log

Chart 1. Roberto Bonilla's timesheet.

| Activity                    | Time(h) |
|:---------------------------:|:-------:|
| Planning                    |    2h   |
| Writing code                |    4h   |
| Writing documentation       |    4h   |

Chart 2. Pablo Rodriguez's timesheet.

| Activity                    | Time(h) | Description |
|:---------------------------:|:-------:|:-----------:|
| Planning                    |    2h   | Meeting with Roberto |
| Researching              	   |    1h   | Researching on the Internet and with the tutors|
| Writing code                |    5h   | Making the assembler code |
| Writing code                |    4h   | Debugging the button |
| Writing documentation       |    2h   | Internal Documentation and External |

## References

