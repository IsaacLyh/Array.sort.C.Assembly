.syntax unified

.text

.align 8
.global remove_val_ARM
.func remove_val_ARM, remove_val_ARM
.type remove_val_ARM, %function

remove_val_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
	cmp r0,#0	@null check
	beq badend	@bad end
	mov r4,#0      @ i = 0
	ldr r5,[r0,#4] @ r5 =size
	mov r6,r0      @ load r6 r0 for modify
	ldr r7,[r6]	@r7 = int[]
	mov r10,#0
	b loop
	
	loop:
		cmp r4,r5	@check if index == size
		beq badend			
		ldr r8,[r7,r4,lsl #2]	@let r8 = int [i]
		mov r9,r4		@let r9 be i
		cmp r8,r1		@check if r8 is the val need to remov
		beq loop2		@if so execute
		add r4,r4,#1		@if not increase index and keep searching
		b loop
	loop2:
		cmp r9,r5		@check if index == size
		beq end			@if so end
		add r9,r9,#1		@increase index
		ldr r8,[r7,r9,lsl #2]	@let r8 be int[i+1]
		cmp r8,r1		@check if int[i+1]==val
		beq found		@if so keep going
		sub r9,r9,#1
		b remove
	found:
		add r10,r10,#1
		b loop2
	
	remove:
		cmp r9,r5		@check if r9 == r5
		beq end			@if so end	
		add r9,r9,#1		@if not add 1
		ldr r8,[r7,r9,lsl #2]	@let r8 be be the different num
		str r8,[r7,r4,lsl #2]	@store r8 to pos need
		add r4,r4,#1		@increase r4 by1
		b remove		
	end:
		mov r12,#0
		ldr r12,[r6,#4]
		add r10,r10,#1
		sub r12,r12,r10
		str r12,[r6,#4]
		mov r0,r10		@return 
		pop {r4-r11, ip, lr}
		bx lr
	badend:
		mov r0,#-1

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

