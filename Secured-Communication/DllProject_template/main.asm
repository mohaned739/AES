include irvine32.inc
BUFFER_SIZE = 5000
.data
	;------------------------------------------------------------------------------------
	filename BYTE "C:\Users\Dell\Desktop\Assembly project\Secured-Communication\ClientSide\bin\Debug\key.txt",0
	fileHandle HANDLE ?
	bytesWritten dword ?
	generated_matrix  byte 4 dup(4 dup(?))
	text1 byte 4 dup(4 dup(?))
    arr1_size dword 16
	generated_key byte 4 dup(4 dup(?))
    arr2 byte 4 dup(?)
    arr3 byte 4 dup(?)
    counter byte 0
	rev dword -16
	divsor dword 10h
len1 byte lengthof SBOX_R0
colindex byte ?
rowindex byte ?

mix_matrix  byte 2h,3h,1h,1h
		    byte 1h,2h,3h,1h
		    byte 1h,1h,2h,3h
		    byte 3h,1h,1h,2h
mix_size = ($-offset mix_matrix)
inv_mix_matrix byte 0eh,0bh,0dh,09h
			   byte 09h,0eh,0bh,0dh
			   byte 0dh,09h,0eh,0bh
			   byte 0bh,0dh,09h,0eh	
X0 byte ?
X1 byte ?
X2 byte ?
X3 byte ?
element_count byte 0
col byte 0
row byte 0
mix byte 16 dup(?)
round dword 10
four dword 4
zero dword 0
	Round_constant  byte 01h,02h,04h,08h,10h,20h,40h,80h,1bh,36h
                byte 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
				byte 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
				byte 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

	;################ S-BOX ######################################;

 SBOX_R0  Byte 63h,7Ch,77h,7Bh,0F2h,6Bh,6Fh,0C5h,30h,01h,67h,2Bh,0FEh,0D7h,0ABh,76h
 SBOX_R1  Byte 0CAh,82h,0C9h,7Dh,0FAh,59h,47h,0F0h,0ADh,0D4h,0A2h,0AFh,9Ch,0A4h,72h,0C0h
 SBOX_R2  Byte 0B7h,0FDh,93h,26h,36h,3Fh,0F7h,0CCh,34h,0A5h,0E5h,0F1h,71h,0D8h,31h,15h
 SBOX_R3  Byte 04h,0C7h,23h,0C3h,18h,96h,05h,9Ah,07h,12h,80h,0E2h,0EBh,27h,0B2h,75h
 SBOX_R4  Byte 09h,83h,2Ch,1Ah,1Bh,6Eh,5Ah,0A0h,52h,3Bh,0D6h,0B3h,29h,0E3h,2Fh,84h
 SBOX_R5  Byte 53h,0D1h,00h,0EDh,20h,0FCh,0B1h,5Bh,6Ah,0CBh,0BEh,39h,4Ah,4Ch,58h,0CFh
 SBOX_R6  Byte 0D0h,0EFh,0AAh,0FBh,43h,4Dh,33h,85h,45h,0F9h,02h,7Fh,50h,3Ch,9Fh,0A8h
 SBOX_R7  Byte 51h,0A3h,40h,8Fh,92h,9Dh,38h,0F5h,0BCh,0B6h,0DAh,21h,10h,0FFh,0F3h,0D2h
 SBOX_R8  Byte 0CDh,0Ch,13h,0ECh,5Fh,97h,44h,17h,0C4h,0A7h,7Eh,3Dh,64h,5Dh,19h,73h
 SBOX_R9  Byte 60h,81h,4Fh,0DCh,22h,2Ah,90h,88h,46h,0EEh,0B8h,14h,0DEh,5Eh,0Bh,0DBh
 SBOX_R10 Byte 0E0h,32h,3Ah,0Ah,49h,06h,24h,5Ch,0C2h,0D3h,0ACh,62h,91h,95h,0E4h,79h
 SBOX_R11 Byte 0E7h,0C8h,37h,6Dh,8Dh,0D5h,4Eh,0A9h,6Ch,56h,0F4h,0EAh,65h,7Ah,0AEh,08h
 SBOX_R12 Byte 0BAh,78h,25h,2Eh,1Ch,0A6h,0B4h,0C6h,0E8h,0DDh,74h,1Fh,4Bh,0BDh,8Bh,8Ah
 SBOX_R13 Byte 70h,3Eh,0B5h,66h,48h,03h,0F6h,0Eh,61h,35h,57h,0B9h,86h,0C1h,1Dh,9Eh
 SBOX_R14 Byte 0E1h,0F8h,98h,11h,69h,0D9h,8Eh,94h,9Bh,1Eh,87h,0E9h,0CEh,55h,28h,0DFh
 SBOX_R15 Byte 8Ch,0A1h,89h,0Dh,0BFh,0E6h,42h,68h,41h,99h,2Dh,0Fh,0B0h,54h,0BBh,16

 ;########################## inverse-SBOX ##########################################

 Inv_SBOX_R0  Byte 52h, 09h, 6ah, 0d5h, 30h, 36h, 0a5h, 38h, 0bfh, 40h, 0a3h, 9eh, 81h, 0f3h, 0d7h, 0fbh
 Inv_SBOX_R1  Byte 7ch, 0e3h, 39h, 82h, 9bh, 2fh, 0ffh, 87h, 34h, 8eh, 43h, 44h, 0c4h, 0deh, 0e9h, 0cbh
 Inv_SBOX_R2  Byte 54h, 7bh, 94h, 32h, 0a6h, 0c2h, 23h, 3dh, 0eeh, 4ch, 95h, 0bh, 42h, 0fah, 0c3h, 4eh
 Inv_SBOX_R3  Byte 08h, 2eh, 0a1h, 66h, 28h, 0d9h, 24h, 0b2h, 76h, 5bh, 0a2h, 49h, 6dh, 8bh, 0d1h, 25h
 Inv_SBOX_R4  Byte 72h, 0f8h, 0f6h, 64h, 86h, 68h, 98h, 16h, 0d4h, 0a4h, 5ch, 0cch, 5dh, 65h, 0b6h, 92h
 Inv_SBOX_R5  Byte 6ch, 70h, 48h, 50h, 0fdh, 0edh, 0b9h, 0dah, 5eh, 15h, 46h, 57h, 0a7h, 8dh, 9dh, 84h
 Inv_SBOX_R6  Byte 90h, 0d8h, 0abh, 00h, 8ch, 0bch, 0d3h, 0ah, 0f7h, 0e4h, 58h, 05h, 0b8h, 0b3h, 45h, 06h
 Inv_SBOX_R7  Byte 0d0h, 2ch, 1eh, 8fh, 0cah, 3fh, 0fh, 02h, 0c1h, 0afh, 0bdh, 03h, 01h, 13h, 8ah, 6bh
 Inv_SBOX_R8  Byte 3ah, 91h, 11h, 41h, 4fh, 67h, 0dch, 0eah, 97h, 0f2h, 0cfh, 0ceh, 0f0h, 0b4h, 0e6h, 73h
 Inv_SBOX_R9  Byte 96h, 0ach, 74h, 22h, 0e7h, 0adh, 35h, 85h, 0e2h, 0f9h, 37h, 0e8h, 1ch, 75h, 0dfh, 6eh
 Inv_SBOX_R10 Byte 47h, 0f1h, 1ah, 71h, 1dh, 29h, 0c5h, 89h, 6fh, 0b7h, 62h, 0eh, 0aah, 18h, 0beh, 1bh
 Inv_SBOX_R11 Byte 0fch, 56h, 3eh, 4bh, 0c6h, 0d2h, 79h, 20h, 9ah, 0dbh, 0c0h, 0feh, 78h, 0cdh, 5ah, 0f4h
 Inv_SBOX_R12 Byte 1fh, 0ddh, 0a8h, 33h, 88h, 07h, 0c7h, 31h, 0b1h, 12h, 10h, 59h, 27h, 80h, 0ech, 5fh
 Inv_SBOX_R13 Byte 60h, 51h, 7fh, 0a9h, 19h, 0b5h, 4ah, 0dh, 2dh, 0e5h, 7ah, 9fh, 93h, 0c9h, 9ch, 0efh
 Inv_SBOX_R14 Byte 0a0h, 0e0h, 3bh, 4dh, 0aeh, 2ah, 0f5h, 0b0h, 0c8h, 0ebh, 0bbh, 3ch, 83h, 53h, 99h, 61h
 Inv_SBOX_R15 Byte 17h, 2bh, 04h, 7eh, 0bah, 77h, 0d6h, 26h, 0e1h, 69h, 14h, 63h, 55h, 21h, 0ch, 7dh
;#######################################################
.code

;----------------------------------------------------------
;Calculates: encrypt message.
;Recieves: text, key and length.
;Returns: Encrypted message.
;----------------------------------------------------------
Encrypt proc text:PTR byte, key: PTR byte, len:Dword
pushAD
mov ecx,arr1_size ;16
mov esi,offset text1
mov edi, offset generated_key
mov eax, text
mov ebx,key
fill_text:
movzx edx,byte ptr[esi]
mov dl,[eax]
mov [esi],dl
movzx edx,byte ptr[edi]
mov dl,[ebx]
mov [edi],dl
inc esi
inc edi
inc eax
inc ebx
loop fill_text

call empty_file
mov esi,offset generated_key
	mov edi,offset text1
	
	call add_round_key
	
	mov ecx,10
	encr_loop:
	push ecx
	mov edx,0
mov ecx,4
l1:
mov esi,offset text1
mov edi,offset arr2
mov eax,4
dec eax

call col_to_row
mov esi,offset SBOX_R0
call subbyte

mov esi,offset arr2
mov edi,offset text1
mov eax,4
dec eax

call row_to_col

inc edx
loop l1

pop ecx
push ecx
call shift_row
cmp ecx,1
je skip
call mix_encr
skip:
call write_file
call generation_key
mov esi,offset generated_key
mov edi,offset text1
call add_round_key

pop ecx
inc counter
loop encr_loop
call write_file


mov ecx,arr1_size ;16
mov esi,text
mov edi,offset text1
return_text:
movzx eax,byte ptr[edi]
mov [esi],al
inc esi
inc edi
loop return_text
popAD
ret
Encrypt Endp
;################################################################################
;----------------------------------------------------------
;Calculates: Decrypt message.
;Recieves: encrypted text, key and length.
;Returns: Decrypted message.
;----------------------------------------------------------

Decrypt proc text:PTR byte, key: PTR byte, len:Dword
pushAD
mov ecx,arr1_size ;16
mov esi,offset text1
mov edi, text
fill:
movzx edx,byte ptr[esi]
mov dl,[edi]
mov [esi],dl
inc esi
inc edi
loop fill
	call read_file

mov esi,offset generated_key
mov edi,offset text1
call add_round_key

mov ecx,10
decr_loop:
push ecx
call inv_shift_rows

mov edx,zero
mov ecx,four
l1:
mov esi,offset text1
mov edi,offset arr2
mov eax,four
dec eax

call col_to_row
mov esi,offset Inv_SBOX_R0	
call subbyte

mov esi,offset arr2
mov edi,offset text1
mov eax,four
dec eax

call row_to_col

inc edx
loop l1

mov eax,rev
movzx ebx,len1
sub eax,ebx
mov rev,eax
call read_file

mov esi,offset generated_key
mov edi,offset text1
call add_round_key

pop ecx
push ecx
cmp ecx,1
je skip
call mix_decr
skip:
pop ecx
loop decr_loop

mov ecx,arr1_size ;16
mov esi,text
mov edi,offset text1
return_text:
movzx eax,byte ptr[edi]
mov [esi],al
inc esi
inc edi
loop return_text


popAD
ret
Decrypt Endp
;#################################################################################

;################## ADD ROUND KEY #########################
;----------------------------------------------------------
;Calculates: Add Key To Text.
;Recieves: esi->key and edi->text1 .
;Returns: Text after adding round key.
;----------------------------------------------------------

add_round_key proc uses esi edi ecx
mov ecx,arr1_size ; 16
l1:
mov al,[esi]
 xor [edi],al
 inc esi
 inc edi
 loop l1
 ret
add_round_key  endp


;################# SUB BYTE #########################
;----------------------------------------------------------
;Calculates: Substitute each cell in text with corsponding one in S-box.
;Recieves: edi-> destination(column from text1 matrix) esi-> which matrix to use(s-box/inverse s-box).
;Returns: column after substituting its cells
;----------------------------------------------------------

subbyte proc uses edx ecx esi
	mov ecx,four
addressloop:
mov edx,zero
mov eax,zero 
movzx eax,byte ptr [edi]
div divsor 
	mov colindex, dl 
	mov rowindex,al
mov edx,zero
mov al,rowindex
mul len1
add al,colindex
mov bl,[esi+eax]
mov [edi],bl
inc edi
loop addressloop
ret
  subbyte endp

;############### COLUMN TO ROW ##########################
;----------------------------------------------------------
;Calculates: convert column from matrix to row.
;Recieves: esi->source , edi-> destination , eax-> The number of columns , edx->start index.
;Returns: array containing elements from column 
;----------------------------------------------------------
col_to_row proc uses esi edi edx ecx eax
mov ecx,four

	add esi,edx
	l1:
	movsb
	add esi,eax
	loop l1

	 ret
 col_to_row endp  

;################ ROW TO COLUMN #########################
;----------------------------------------------------------
;Calculates: convert array to column in text matrinx.
;Recieves: esi->source , edi-> destination , eax-> The number of columns , edx->start index.
;Returns: elements to column in the matrix 
;----------------------------------------------------------
row_to_col proc uses esi edi edx ecx
mov ecx,four

	add edi,edx
	l1:
	movsb
	add edi,eax
	loop l1

	 ret
 row_to_col endp
 ;##################### SHIFT ROWS ##############################
 ;----------------------------------------------------------
;Calculates: rotate each row in matrix according to the number of row.
;Recieves: text matrix.
;Returns: matrix after shifting its rows  
;----------------------------------------------------------
 shift_row proc uses ecx
;###########################   First Row Rotation  ###########################
mov ecx,four
dec ecx
mov esi,offset text1
add esi,four
inc esi
mov edi,offset text1
add edi,four
mov al,text1[4]
rep movsb
mov [text1+7] , al
;#################  Second Row Rotation  #####################################
mov edi,offset text1
add edi,four
add edi,four
mov eax,[edi]
ror eax,16
mov [edi],eax
;#######################  Third Row Rotation  ################################
mov edi,offset text1
add edi,four
add edi,four
add edi,four
mov eax,[edi]
ror eax,24
mov [edi],eax

ret
shift_row endp


;####################### INVERSE SHIFT ROWS ##################################
;----------------------------------------------------------
;Calculates: rotate each row in matrix according to the number of row in inverse direction to last procedure.
;Recieves: text matrix.
;Returns: matrix after shifting its rows  
;----------------------------------------------------------
inv_shift_rows proc
 ;###########################   First Row Inverse  ###################################################
mov edi,offset text1
add edi,four
mov eax,[edi]
ror eax,24
mov [edi],eax
;#################  Second Row Inverse  ###########################################
mov edi,offset text1
add edi,four
add edi,four
mov eax,[edi]
ror eax,16
mov [edi],eax
;############################  Third Row Inverse  ######################################
mov edi,offset text1
add edi,four
add edi,four
add edi,four
mov eax,[edi]
ror eax,8
mov [edi],eax
ret
inv_shift_rows endp

;############################ MULT 02 #########################################
;----------------------------------------------------------
;Calculates: multiply number by 2.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
mult02 proc uses eax
shl dl,1
jc hasone
jmp next

hasone :
mov eax,1bh
xor dl,al
next:
ret
 mult02 endp
;######################## MULT 03 ###############################################
;----------------------------------------------------------
;Calculates: multiply number by 3.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
mult03 proc
mov X0,dl
call mult02
mov X1,dl
xor dl,X0 
ret
mult03 endp

;#####################  MULT 09 #################################################
;----------------------------------------------------------
;Calculates: multiply number by 9.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
mult09 proc
mov X0,dl
call mult02
mov X1,dl
call mult02
mov X2,dl
call mult02
mov X3,dl
xor dl,X0
ret
mult09 endp

;###################### MULT 0B ################################################
;----------------------------------------------------------
;Calculates: multiply number by 11.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
 mult0b proc
 call mult09
 xor dl,X1
 ret
 mult0b endp

;################### MULT 0D ##################################################
;----------------------------------------------------------
;Calculates: multiply number by 13.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
mult0d proc 
Call mult09
xor dl,x2
ret 
mult0d endp

;##################### MULT 0E #################################################
;----------------------------------------------------------
;Calculates: multiply number by 14.
;Recieves: two numbers.
;Returns: multiplication of the two numbers.  
;----------------------------------------------------------
mult0e proc
mov X0,dl
call mult02
mov X1,dl
call mult02
mov X2,dl
call mult02
mov X3,dl
xor dl,X2
xor dl,X1
ret
mult0e endp

;########################### MIX COLUMNS ENCRYPTION ##############################
;----------------------------------------------------------
;Calculates: Mix columns for matrix.
;Recieves: text matrix and mix matrix
;Returns: matrix after multiplying column and row and adding the results of multiplication.  
;----------------------------------------------------------
mix_encr proc
mov ecx,four
mov eax,zero
mov col,al
col_loop:

 push ecx
 mov ecx ,four
 mov eax,zero
 mov row,al

 row_loop:
 push ecx
 mov esi, offset text1
 movzx eax,col
 add esi,eax

 mov edi, offset mix_matrix
 movzx eax,row
 add edi,eax
 
 mov ecx ,four

l1:
movzx edx,byte ptr [esi]
movzx ebx,byte ptr[edi]

cmp ebx,02h
jne mul3 
call mult02 
push edx
jmp next

mul3: 
cmp ebx,03h
jne mul1 
call mult03
push edx
jmp next
mul1: 
push edx
next:
inc edi
add esi,four
Loop l1

mov ecx,four
dec ecx
pop edx
l2:
pop ebx
xor dl,bl
Loop l2


pop ecx

push edx

mov edx,four
add row,dl

loop row_loop

call fill_matrix

inc col
pop ecx
dec ecx
cmp ecx,0
jne col_loop
ret
mix_encr endp

;####################### Fill Matrix #############################
;----------------------------------------------------------
;Calculates: return elements from stack to matrix
;Recieves: elements from text matrix
;Returns: fill elements from stack into text matrix.  
;----------------------------------------------------------
fill_matrix proc
pop eax
mov ecx,four
fill_loop:
sub esi,sizeof mix_matrix
pop edx
mov [esi],dl
Loop fill_loop
push eax
ret
fill_matrix endp

;########################### MIX COLUMNS DECRYPTION ##############################
;----------------------------------------------------------
;Calculates: Reverse Mix columns for matrix.
;Recieves: text matrix and inverse mix matrix
;Returns: matrix after multiplying column and row and adding the results of multiplication.  
;----------------------------------------------------------
mix_decr proc
mov ecx,four
mov eax,zero
mov col,al
col_loop:
 push ecx
 mov ecx ,four
 mov eax,zero
 mov row,al
 row_loop:
 push ecx
 mov esi, offset text1
 movzx eax,col
 add esi,eax
 mov edi, offset inv_mix_matrix
 movzx eax,row
 add edi,eax
 mov ecx ,four
l1:
movzx edx,byte ptr [esi]
movzx ebx,byte ptr[edi]

cmp ebx,09h
jne mulb 
call mult09 
push edx
jmp next

mulb: 
cmp ebx,0bh
jne muld 
call mult0b
push edx
jmp next

muld:
cmp ebx,0dh
jne mule 
call mult0d
push edx
jmp next

mule:
call mult0e
push edx
next:
inc edi
add esi,four
Loop l1

mov ecx,four
dec ecx
pop edx
l2:
pop ebx
xor dl,bl
Loop l2


pop ecx

push edx
mov edx,four
add row,dl
loop row_loop
call fill_matrix
inc col
pop ecx
dec ecx
cmp ecx,0
jne col_loop
;Loop col_loop
ret
mix_decr endp
;##################################################################################


;################### KEY GENERATION ##################################
;----------------------------------------------------------
;Calculates: generate key for each round.
;Recieves: key , arr2 and arr3.
;Returns: new key.  
;----------------------------------------------------------
generation_key proc uses eax ebx ecx edx esi edi ebp
 ;get last column in array from key (w3)
 mov esi,offset generated_key
mov edi,offset arr2 
mov edx,3
mov eax,four
dec eax
 call col_to_row
 ;shift the column we got in array
 mov edi,offset arr2
		mov eax ,[edi]
		ror eax ,8
		mov [edi],eax

mov esi,offset SBOX_R0
call subbyte
;xor the result after subbyte (arr2) with the first column in constant matrix
;so we get the first col from consst in array (arr3)
mov esi,offset Round_constant
 mov edi,offset arr3

 movzx edx,byte ptr [counter]
 mov eax,lengthof Round_constant
 dec eax
call col_to_row
 
;xor const (arr3) with the result (arr2) and save xor result in arr3
mov edi,offset arr2
mov esi,offset arr3
mov ecx,four
lopp:
mov al,byte ptr[edi]
xor al,[esi]
mov [esi],al
inc esi
inc edi
loop lopp
; xor the result (arr3) with (w0) 
;so we get w0 in arr2 to xor it with arr3
mov esi,offset generated_key
mov edi, offset arr2
mov edx ,zero
mov eax,four
dec eax
call col_to_row

mov edi,offset arr2
mov esi,offset arr3
mov ecx,four
lopp2:
mov al,byte ptr[edi]
xor al,[esi]
mov [esi],al
inc esi
inc edi
loop lopp2
;move the result to w4 to the new matrix (generated_matrix)
mov ecx,four
mov ebp,offset generated_matrix
mov esi,offset arr3
move:
mov al,byte ptr[esi]
mov [ebp],al
inc esi
add ebp,four
loop move
;we xor w4 with w1 to get w5 so we get them in arrays----------------
mov esi,offset generated_key
mov edi, offset arr2
mov eax,four
dec eax
mov edx ,1
call col_to_row
mov esi,offset generated_matrix
mov edi, offset arr3
mov edx ,zero
mov eax,four
dec eax
call col_to_row
;we get them in arrays then xor them and save in arr3
mov edi,offset arr2
mov esi,offset arr3
mov ecx,four
lopp3:
mov al,byte ptr[edi]
xor al,[esi]
mov [esi],al
inc esi
inc edi
loop lopp3
;move the result to w5 in new matrix
mov ecx,four
mov ebp,offset generated_matrix
mov esi,offset arr3
move1:
mov al,byte ptr[esi]
mov [ebp+1],al
inc esi
add ebp,four
loop move1
;we xor w5 with w2 to get w6 so we get them in arrays----------------
mov esi,offset generated_key
mov edi, offset arr2
mov edx ,2
mov eax,four
dec eax
call col_to_row
mov esi,offset generated_matrix
mov edi, offset arr3
mov edx ,1
mov eax,four
dec eax
call col_to_row
;we get them in arrays then xor them and save in arr3
mov edi,offset arr2
mov esi,offset arr3
mov ecx,four
lopp4:
mov al,byte ptr[edi]
xor al,[esi]
mov [esi],al
inc esi
inc edi
loop lopp4
;move the result to w5 in new matrix
mov ecx,four
mov ebp,offset generated_matrix
mov esi,offset arr3
move2:
mov al,byte ptr[esi]
mov [ebp+2],al
inc esi
add ebp,four
loop move2
;we xor w6 with w3 to get w7 so we get them in arrays----------------
mov esi,offset generated_key
mov edi, offset arr2
mov edx ,3
mov eax,four
dec eax
call col_to_row
mov esi,offset generated_matrix
mov edi, offset arr3
mov edx ,2
mov eax,four
dec eax
call col_to_row
;we get them in arrays then xor them and save in arr3
mov edi,offset arr2
mov esi,offset arr3
mov ecx,four
lopp5:
mov al,byte ptr[edi]
xor al,[esi]
mov [esi],al
inc esi
inc edi
loop lopp5
;move the result to w5 in new matrix
mov ecx,four
mov ebp,offset generated_matrix
mov esi,offset arr3
move3:
mov al,byte ptr[esi]
mov [ebp+3],al
inc esi
add ebp,four
loop move3
cld
mov esi , offset generated_matrix
mov edi ,offset generated_key
mov ecx ,arr1_size


rep movsb 


 ret
 generation_key endp




 ;############################## WRITE TO FILE ######################################
 write_file proc
INVOKE CreateFile,
ADDR filename,
GENERIC_WRITE, 
DO_NOT_SHARE, 
NULL,
OPEN_ALWAYS, 
FILE_ATTRIBUTE_NORMAL, 
0
 
mov fileHandle,eax ; save file handle
cmp eax , INVALID_HANDLE_VALUE
je QuitNow
 
INVOKE setfilepointer,
fileHandle ,0,0,FILE_END
 
INVOKE WriteFile, ; write text1 to file
fileHandle, ; file handle
ADDR generated_key, ; buffer pointer
arr1_size, ; number of bytes to write
ADDR bytesWritten, ; number of bytes written
0 ; overlapped execution flag
 
INVOKE CloseHandle, fileHandle
QuitNow:
ret
write_file endp


;################# READ FILE ##################################

read_file proc

INVOKE CreateFile,
ADDR filename,
GENERIC_READ, 
DO_NOT_SHARE, 
NULL,
OPEN_EXISTING, 
FILE_ATTRIBUTE_NORMAL, 
0
 
mov fileHandle,eax ; save file handle
cmp eax , INVALID_HANDLE_VALUE
je QuitNow
 
INVOKE setfilepointer,
fileHandle ,rev,0,FILE_END
 
INVOKE ReadFile, ; write text1 to file
fileHandle, ; file handle
ADDR generated_key, ; buffer pointer
arr1_size, ; number of bytes to write
ADDR bytesWritten, ; number of bytes written
0 ; overlapped execution flag
 
INVOKE CloseHandle, fileHandle
QuitNow:

ret
read_file endp




;##########################  EMPTY FILE ###################################
empty_file proc
INVOKE CreateFile,
ADDR filename,
GENERIC_WRITE, 
DO_NOT_SHARE, 
NULL,
TRUNCATE_EXISTING, 
FILE_ATTRIBUTE_NORMAL, 
0

mov fileHandle,eax ; save file handle
cmp eax , INVALID_HANDLE_VALUE
je QuitNow

INVOKE CloseHandle, fileHandle
QuitNow:
ret
empty_file endp
;#############################################################
; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain