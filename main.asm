;
; LEDS.asm
;
; Created: 13/10/2015 12:52:58 p.m.
;

.include "tn85def.inc"

.def BUTTON = R25 ; Last State of BUTTON
.def SPEED = R24 ;1-4 
.def LED = R23 ;1-4 number of led
.def TEMP = r16

.cseg

;Initialize Inputs and Outputs
	LDI TEMP,(1<<DDB4)|(1<<DDB3)|(1<<DDB2)|(1<<DDB1);PB0 as Input
	LDI BUTTON, 1
	LDI SPEED, 1
	OUT DDRB,TEMP
 ;The algorithm to move the leds is based on a register LED
 ;representing a PORTB auxiliar and we can go changing the register
 ;and doing an OR with the fixed leds we get the result. Using CPI and the
 ;limit bit we restart the cycle
Start1:
	CLT;Using flag T to specify change mode
	LDI SPEED, 4
Restart1:
	LDI LED, 1
Mode1:
	LSL LED; change led
	CPI LED,(1<<5) ; Subtract (1<<5) from LED
	BREQ restart1; Branch if we got to the edge
	LDI TEMP, (1<<PB0) ; fixed leds, none except for the pull up
	OR TEMP, LED ;
	OUT    PORTB, TEMP
	RCALL  delay
	BRTS start2; Changes mode depending of the flag T
	RJMP mode1 ;Loop
; The structure is based on an init for each mode, The start for the cycle and
; the change of the led
Start2:
	CLT
	LDI SPEED, 3
Restart2:
	LDI LED, (1<<4)
Mode2:
	LSR LED
	CPI LED, 1
	BREQ restart2
	LDI    TEMP,(1<<PB0)|(1<<PB4)
	OR TEMP, LED
	OUT    PORTB, TEMP
	RCALL  delay
	BRTS start3
	RJMP mode2;Loop

Start3:	
	CLT
	LDI SPEED, 2
Restart3:
	LDI LED, 1
Mode3:
	LSL LED
	CPI LED,(1<<3) ; Subtract 3 from LED
	BREQ restart3
	LDI    TEMP,(1<<PB0)|(1<<PB4)|(1<<PB3)
	OR TEMP, LED
	OUT    PORTB, TEMP
	RCALL  delay
	BRTS start4
	RJMP mode3;Loop

Start4:
	LDI SPEED, 1
	CLT
	LDI LED, (1<<5)
Mode4:
	LDI    TEMP,(1<<PB0)|(1<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)
	OUT    PORTB, TEMP
	RCALL  delay
	BRTS start1
	LDI    TEMP,(1<<PB0)|(1<<PB4)|(1<<PB3)|(1<<PB2)
	OUT    PORTB, TEMP
	RCALL  delay
	BRTS start1
	RJMP mode4;Loop

 
;Delay subroutine
:Algorithm: Using three registers for a delay, reducing by one this values
; And executing the read button to dont waste time while delaying
Delay:
	MOV r20, SPEED      ; One clock cycle;
	LSL r20
	LSL r20

Delayloop:
	LDI r19, 25
	Delay1:
	LDI r18, 10
	Delay2:
	LDI r17, 75	
	Delay3:
	DEC r17
	NOP
	BRNE delay3

	RCALL readbutton
	BRTS return

	DEC r18
	NOP
	BRNE delay2

	RCALL readbutton
	BRTS return

	DEC r19
	NOP
	BRNE delay1

	RCALL readbutton
	BRTS return

	DEC     r20           ; One clock Cycle
	
	BRNE    delayloop          ; Two clock cycles
Return:
	RET



ReadButton:
	SBIC pinb, 0; reads the button
	RJMP highpin
	CPI BUTTON , 0; look for a change in state for a pressed button
	LDI BUTTON, 0
	BRNE changestate
	RET
HighPIN:; Button not pressed
	LDI BUTTON, 1
	RET
ChangeState:
	SET ; Use flag t for button
	RET