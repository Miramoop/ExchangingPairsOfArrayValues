; 
; CSCI268 - Final - Exchanging Pairs of Array Values
; Miranda Morris
; 4/18/2024
; This code uses a loop and indexed addressing to 
; exchange every pair of values in an array with an 
; even number of elements. Therefore, item i will
; exchange with item+1, and item i+2 will exchange
; with item i+3, and so on.

.586
.model flat, stdcall
option casemap : none; case-sensitive

ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data ; Start of data segment
array DWORD 1,3,6,7,9,10,11,15

.code ; Start of code segment
main proc ; Start of main procedure
mov esi, OFFSET array				; offsets the array so the address
									; of the first item is kept
mov ecx, LENGTHOF array / 2			; changes the value of ecx to 4 
									; which is half of the array

L1:									; loop is created
mov eax,[esi]						; get the number pairs from array
mov ebx,[esi + 4]

mov [esi],ebx						; swap the pairs in the array
mov [esi + 4], eax

add esi, TYPE array * 2				; DWORD equals 4 bytes so we increment
									; the esi register by 8 in order to 
									; get to the next pair in the array

loop L1  

	invoke ExitProcess,0
main endp

end main