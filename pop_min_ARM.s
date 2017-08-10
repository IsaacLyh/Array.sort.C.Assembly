.syntax unified

.text

.align 8
.global pop_min_ARM
.func pop_min_ARM, pop_min_ARM
.type pop_min_ARM, %function

pop_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
	cmp r0,#0 	@ ls == null ? 
	beq badend	@ return -1
	ldr r4,[r0,#4]	@ r4 = size
	cmp r4,#0       @ size == 0 ?
	beq badend	@ return -1
	ldr r4,[r0]	@ r4 = list's int array
	ldr r5,[r4]	@ r5 = int[0]
	mov r6,#0	@r6 = i=0
	ldr r11,[r0,#4]	@r11= size
	b while

	while:
		ldr r7,[r4,r6,lsl #2]
		cmp r7,r5
		mov r8,#0
		beq found
		b end
		
	found:
		ldr r12,[r0,#4]
		sub r12,r12,#1
		str r12,[r0,#4]
		b remove
	remove:
		cmp r8,r11
		beq while
		mov r10,#0
		add r10,r8,#1
		ldr r9,[r4,r10,lsl #2]
		str r9,[r4,r8,lsl #2]
		add r8,r8,#1
		b remove
		
	end:
		mov r0,r5


	badend:
		mov r0,#-1



    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

