@PID:A91018743
@NAME: YUHANG LIAN



.syntax unified




.text

.align 8
.global get_max_ARM
.func get_max_ARM, get_max_ARM
.type get_max_ARM, %function

get_max_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}
    @ YOUR CODE GOES HERE (list *ls is in r0)
    @ (your code)
    @check if the pointer is null
    
    cmp r0,#0
    beq isNull
    @load the size check if empty
    
    ldr r5,[r0,#4]
    cmp r5,#0
    @jump to label empty
    beq empty
    
    @load the size and get the max val
    ldr r1,[r0,#4]
    ldr r2,[r0]
    sub r1,r1,1
    ldr r0,[r2,r1,lsl #2]
    B end
    
    @cases to deal with--empty array or null pointer
    empty:
    	mov r0,#-1
    isNull:
	mov r0,#-1
    end:
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

