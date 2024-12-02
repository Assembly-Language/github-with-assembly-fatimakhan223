include irvine32.inc
.data
msg1 db "The sum of positive elements of array is : ",0
msg2 db "Total number of positive values : ",0
msg3 db "Value not found.",0
array SWORD -3,-6,-1,-10,10,30,40,4

.code
main proc
    
mov esi,OFFSET array
mov ecx,Lengthof array
mov eax,0
mov ebx,0

next:
test WORD PTR [esi],8000h       ;1000 0000 0000 0000  in binary we will take AND by the test instruction to the first value of array
pushfd
jnz skip                        ;skip the negative number
add ax, WORD PTR [esi]
inc ebx
popfd
skip:
add esi,TYPE array
LOOPnz next
    cmp ebx,0                   ;it will subtract the 0 form the value of ebx if there is val in it then it will raised the zf 
    je no_posi_val              ;it will jump to the last label je checks the zf if the zf not raised then it will jump

;sum of positive values
    mov edx, OFFSET msg1
    call writestring
    movzx eax,ax
    call writeint
    call crlf

;num of positive values
mov edx, OFFSET msg2
    call writestring
    mov eax,ebx
    call writeint
    call crlf
jmp end_program

no_posi_val:
    mov edx,OFFSET msg3
    call writestring
    call crlf
end_program:
exit
main endp
end main