.syntax unified

.text

.align 8
.global createlist_ARM
.func createlist_ARM, createlist_ARM
.type createlist_ARM, %function

createlist_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}
    	
	mov r4,r0    	 @store the maxsize in to r4
	mov r7,#4
	mul r0,r0,r7	 @multiply by 4 get the acturall size	
	bl malloc
	mov r5,r0	 @load r5 the assigned address
	mov r0,r4
	mul r0,r0,r7
	bl malloc
	mov r6,r0
	str r4,[r5,#8]
	str r6,[r5]
	mov r8,#0
	str r8,[r5,#4]
	mov r0,r5
	
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

