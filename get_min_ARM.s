@PID : A91018743
@NAME : YUHANG LIAN
@PARTNER: DONT HAVE ONE

.syntax unified

.text

.align 8
.global get_min_ARM
.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
	@check if the list is null
	cmp r0,#0
	beq isNull
	@if not load size of list and check if it is empty
	ldr r2,[r0,#4]
	cmp r2,#0
	beq empty
    @ (your code)
    	@load the first element in the array
	ldr r1,[r0]
	ldr r0,[r1];
	B end
	@case if the list is empty
	empty:
		mov r0,#-1
	@case if the list is null
	isNull:
		mov r0,#-1
	end:
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
	
.endfunc

.end

