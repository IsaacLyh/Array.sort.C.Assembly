.syntax unified

.text

.align 8
.global insert_ARM
.func insert_ARM, insert_ARM
.type insert_ARM, %function

insert_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val in r1)

        cmp r0,#0      @do null check on the pointer
	beq badend     @branch if the pointer is null
	ldr r4,[r0,#8] @move the max element to register r4
	ldr r5,[r0,#4] @move the current size to register r5
	mov r7,r0      @list* = r7
	add r5,r5,#1   @add 1 to size(size after inserting)
	ldr r6,[r7]    @r6 store int[]
	cmp r5,r4	@compare size and maxsize
	ble keep
	mov r8,r1	@store r1 temply
	b reallo	@if exceed realloc
	
	keep:	
		ldr r5,[r0,#4]	@ set r5 to size of the int[]
		cmp r5,#0	@check if empty ?
		beq size0	@if so do size0
		mov r8,#0	@int pos = 0
		sub r9,r5,#1	@r9 = size -1
		ldr r10,[r6,r9,lsl #2]	@r10 = element at the end of int[]
		cmp r1,r10	@check if val > largest 
		blt less	@if not use less method
		add r9,r9,#1	@set r9 to index of the last of int[]+1
		str r1,[r6,r9,lsl #2]	@store val
		mov r8,r9	@set r8 to pos 
		b end		@end method
	less:				
		ldr r10,[r6,r9,lsl #2]	@r10 = int[] 's last element
		cmp r1,r10		@check if val is smaller 
		bge increase		@if greater -- found the pos
		sub r9,r9,#1		@if not keep search i--
		cmp r9,#0
		blt increase
		b less

	increase:
		add r9,r9,#1		@increase r9 to pos of insert
  		mov r8,r9		@let r8 be r9
		b putin			@jump to putin method
	putin:	
		cmp r5,r8		@check if j is greater than pos
		ble put			@if less or equal,execute put
		sub r12,r5,#1		@set r12 to be 1 j-1
		ldr r11,[r6,r12,lsl #2]	@int[j-1]=r11
		str r11,[r6,r5,lsl #2]	@store to index j
		sub r5,r5,#1		@reduse j by 1
		b putin			
	put:	
		str r1,[r6,r8,lsl #2]	@right now r8 is the pos of insert-> putin
		ldr r5,[r7,#4]		@get size
		b end

	reallo:
		add r4,r4,r4
		mov r1,r4
		mov r3,#4
		mul r1,r4,r1
		ldr r0,[r7]
		bl realloc
		str r4,[r7,#8]
		str r0,[r7]
		mov r1,r8
		mov r0,r7
		b keep
	size0:
		str r1,[r6]
		mov r8,#0
		b end
	badend: 
		mov r0,#-1

    	end:
		add r5,r5,#1
		str r5,[r7,#4]
    		mov r0,r8
    
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

