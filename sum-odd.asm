include irvine32.inc 
.data
msg1 db "The sum of all odd numbers is this : ",0
msg2 db "The total number of odd numbers is this : ",0
msg3 db "There is not any value found.",0
array SWORD 1,2,3,4,5,6,7,8,9,10
.code
main proc
mov esi,OFFSET array
mov ecx,Lengthof array
mov eax,0
mov ebx,0
next:
    test WORD PTR [esi],1h
    pushfd
    jz skip
    add ax,WORD PTR [esi]
    inc ebx
    popfd
skip:
    add esi,TYPE array
    LOOP next
    cmp ebx,0
    je no_odd_val
;Total of odd numbers
    mov edx,OFFSET msg1
    call writestring
    call writeint
    call crlf
;Total number of odd values
    mov edx,OFFSET msg2
    call writestring
    mov eax,ebx
    call writeint
    call crlf
jmp end_program
;if there is no any odd value
no_odd_val:
    mov edx,OFFSET msg3
    call writestring
    call crlf

end_program:
exit
main endp
end main