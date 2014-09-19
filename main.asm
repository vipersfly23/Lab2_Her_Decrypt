;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
; Lab 2 - ECE 382 Hex Decrypt Program
; C2C Hunter Her, USAF / 15 Sept 2014 / 17 Sept 2014
;
; The purpose of this program is to implement a decryption of encrypted hex code given a key, and without a key.
;
;
;***B-Functionality Complete***
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
          .text                           ; Assemble into program memory
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section
            .retainrefs                     ; Additionally retain any sections
                                            ; that have references to current
                                            ; section
.text
stringArray		.byte		0xf8,0xb7,0x46,0x8c,0xb2,0x46,0xdf,0xac,0x42,0xcb,0xba,0x03,0xc7,0xba,0x5a,0x8c,0xb3,0x46,0xc2,0xb8,0x57,0xc4,0xff,0x4a,0xdf,0xff,0x12,0x9a,0xff,0x41,0xc5,0xab,0x50,0x82,0xff,0x03,0xe5,0xab,0x03,0xc3,0xb1,0x4f,0xd5,0xff,0x40,0xc3,0xb1,0x57,0xcd,0xb6,0x4d,0xdf,0xff,0x4f,0xc9,0xab,0x57,0xc9,0xad,0x50,0x80,0xff,0x53,0xc9,0xad,0x4a,0xc3,0xbb,0x50,0x80,0xff,0x42,0xc2,0xbb,0x03,0xdf,0xaf,0x42,0xcf,0xba,0x50,0x8f
key				.byte		0xac, 0xdf, 0x23


stringLength .equ 0x52
keyLength	.equ 0x3
memStore .equ 0x0200


;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
                                            ; Main loop here
;-------------------------------------------------------------------------------
		;Establish main registers and call the subroutine decryptMessage

		mov.w #stringArray,R10
		mov.b #stringLength, R15
		mov.w #memStore, R14
		mov.w #key, R13
		mov.w #keyLength, R4

		call #decryptMessage





endProgram jmp endProgram
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;Subroutine Name: decryptMessage
;Author:
;Function: Decrypts a string of bytes and stores the result in memory.  Accepts
;           the address of the encrypted message, address of the key, and address
;           of the decrypted message (pass-by-reference).  Accepts the length of
;           the message by value.  Uses the decryptCharacter subroutine to decrypt
;           each byte of the message.  Stores theresults to the decrypted message
;           location.
;Inputs: R4, R13, R14, R10, R15,R9
;Outputs: R12
;Registers destroyed: none
;-------------------------------------------------------------------------------


decryptMessage:					;will change the value of R10 *NOTE*
				push R14
				push R13
				push R10
				push R9
				push R6
				push R12

				mov.b #0x0, R6	;encrypted string length to compare to
restartKey		mov.w R13, R9	;points R9 back to the first byte of the key

				mov.b #0x0, R5 ;compare to length of key
contDecrypt		mov.b @R10+,R12	; stores the next encrypted message in R12
				call #decryptCharacter ; XOR the key and the encrpyted message, stores it into R12
				mov.b R12, 0(R14) ;  Stores R12 into the specified memory location in RAM
				inc.w R14 ; Increment R14, to move to the next byte slot in RAM
				inc.w R9 ; Shifts the pointer to the next byte of the key
				inc.w R6	; increments the string length counter
				inc.w R5	; increments the key length counter
				clrz	; ensure the zero flag is clear
				cmp.w R15, R6 	; checks to ensure there is still another byte in the encrypted message
				jz endSubRoutine ;  if there isn't, end the program
				clrz ; ensures z is clear again.
				cmp.w R4, R5 ;  ensures that there is another byte in the key
				jz restartKey ;  if not, load the first byte of the key again.
				jmp contDecrypt ; continue t decrypt message
endSubRoutine
					pop R12
					pop R6
					pop R9
					pop R13
					pop R14
					pop R10
					ret
;-------------------------------------------------------------------------------
;Subroutine Name: decryptCharacter
;Author:
;Function: Decrypts a byte of data by XORing it with a key byte.  Returns the
;           decrypted byte in the same register the encrypted byte was passed in.
;           Expects both the encrypted data and key to be passed by value.
;Inputs: R9, R12
;Outputs: R12
;Registers destroyed: None
;-------------------------------------------------------------------------------


decryptCharacter:
				xor.b @R9,R12 ; XOR the value at the address in R9 and the value in R12
				ret


;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
