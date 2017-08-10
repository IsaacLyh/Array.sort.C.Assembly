.syntax unified

.text

.align 8
.global print_ARM
.func print_ARM, print_ARM
.type print_ARM, %function
strVal: .asciz "%d "





print_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
	cmp r0,#0
	beq badend
	ldr r4,[r0,#4]
	ldr r6,[r0]
	mov r5,#0
	b loop
	

	loop:
		cmp r5,r4
		beq end
		ldr r0,=strVal
		ldr r1,[r6,r5,lsl #2]
		bl printf
		add r5,r5,#1
		b loop
	
	badend:

	end:




    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

