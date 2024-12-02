include irvine32.inc 
.data
msg1 db "The sum of all even numbers is this : ",0
msg2 db "The total number of even numbers is this : ",0
msg3 db "There is not any value found.",0
array SWORD 1,2,3,4,5,6,7,8,9,10
.code
main proc
mov esi,OFFSET array
mov ecx,Lengthof array
mov eax,0
mov ebx,0
next:
test WORD PTR [esi],1h      ;AND operation perform with the LSB of the number
pushfd
jnz skip                    ; if the number is not even and the last bit is not zero then it will jump
add ax, WORD PTR [esi]
inc ebx
popfd
skip:
add esi,TYPE array
    LOOPnz next
    cmp ebx,0               ;sub the 0 from the value in the ebx if it will be zero then set the zf
    je no_even_val          ;if the zf will set then it will jump to the statement there is no any even value

;The sum of even numbers
mov edx,OFFSET msg1
call writestring
    movzx eax,ax
    call writeint
    call crlf
;Total number of even values
mov edx,OFFSET msg2
call writestring
    mov eax,ebx
    call writeint
    call crlf
jmp end_program
;if no value found
no_even_val:
mov edx, OFFSET msg3
call writestring
call crlf
end_program:
exit 
main endp
end main