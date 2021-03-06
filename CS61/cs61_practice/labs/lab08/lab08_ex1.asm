;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 8
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000

LD R6, SUB_TO_UPPER
JSRR R6

LD R0, STRINGZ_PTR
PUTS



HALT
;================
;.ORIG x3000 Data
;================
SUB_TO_UPPER 		.fill x3200
STRINGZ_PTR		.fill x4000

.orig x3200
;-------------------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter (R0): Address to store a string at
; Postcondition: The subroutine has allowed the user to input a string,
;           terminated by the [ENTER] key, has converted the string
;           to upper-case, and has stored it in a null-terminated array that
;           starts at (R0).
; Return Value: R0 ← The address of the now upper case string.
;-------------------------------------------------------------------------------------
ST R7, R7_BACKUP_3200	;backup R7
AND R6, R6, #0		;clear reg
LD R1, ARRAY_PTR
LD R2, MASK

READ_MORE
GETC
OUT
AND R3, R0, R2		;store input into r4
STR R3, R1, #0		;store character in r4 in R1

ADD R1, R1, #1		;increment pointer location by 1
ADD R0, R0, #-10
BRp READ_MORE
ADD R1, R1, #-1
AND R0, R0, #0		;set last input as #0 for stringz
STR R0, R1, #0		;store it

LD R6, ARRAY_PTR

LD R7, R7_BACKUP_3200
RET
;==================
;Data at x3200
;==================
R7_BACKUP_3200 		.BLKW #1 
ARRAY_PTR		.FILL x4000
MASK			.FILL xDF

HEX_NEWLINE .FILL xD

.ORIG x4000
STRING_BLK		.STRINGZ  ""
;=================
;end of program
;================
.END