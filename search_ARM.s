.syntax unified

.text

.align 8
.global search_ARM
.func search_ARM, search_ARM
.type search_ARM, %function

search_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
	
	cmp r0,#0	@ null check
	beq badend
	mov r4,#0	@ i = 0
	ldr r5,[r0,#4]	@ r5 = size
	ldr r6,[r0]	@ r6 = int[] 
	b loop	

	loop:
		cmp r4,r5
		beq end
		ldr r7,[r6,r4,lsl #2]	@ r7 = int[i]
		cmp r7,r1		@ int[i] == val ?
		beq end			@ yes -> return val
		add r4,r4,#1		@ no  -> i++
		b loop		

	badend: 
		mov r0,#-1	@return -1

	end:
		mov r0,r4
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

