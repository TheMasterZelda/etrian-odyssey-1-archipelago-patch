; Can use r0, r2, r12.
; Handle default class selection.
.org 0x02044a5c
.area 4
	bl @LAB_DEFAULT_CLASS_SELECTION
.endarea

; Can use r0, r2, r12.
; Handle default class selection on "create more".
.org 0x02044e2c
.area 4
	bl @LAB_DEFAULT_CLASS_SELECTION
.endarea

; This memory is hijacked from spare memory we get from editing how inputs handling works.
.org 0x02043940
.area 72
@LAB_DEFAULT_CLASS_SELECTION:
	stmdb sp!,{lr}
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	mov r12,-1
	
@@LAB_LOOP:
	add r12,r12,0x1
	ldrb r2,[r0,r12]
	cmp r2,0x00
	beq @@LAB_LOOP
	str r12,[r4,#0x100]
	mov r0,#0x0
	ldmia sp!,{pc}
.endarea



; Can use r0, r1, r2 and r12.
; Handle Down input.
.org 0x02043904
.area 60
	add r0,r5,0x100
	mov r2,r0
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	ldr r12,[r2,0x00]
	
@@LAB_LOOP:
	add r12,r12,0x1
	cmp r12,0x8
	movgt r12,0x00
	ldrb r1,[r0,r12]
	cmp r1,0x00
	beq @@LAB_LOOP
	str r12,[r2,0x00]
	b 0x02043988
.endarea

; Handle Up input.
.org 0x02043810
	add r0,r5,0x100
	mov r2,r0
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	ldr r12,[r2,0x00]
	
@@LAB_LOOP:
	sub r12,r12,0x1
	cmp r12,0x00
	movlt r12,0x08
	ldrb r1,[r0,r12]
	cmp r1,0x00
	beq @@LAB_LOOP
	str r12,[r2,0x00]
	b 0x02043894

; Handle Touchscreen
.org 0x02043a1c
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	ldrb r0,[r0,r4]
	cmp r0,#0x0
	beq 0x02043ae8
	b 0x02043a44


; r0, r1, r12
; r9 contains the class id.
; Handle Rendering adjustment
; This is for the text color/opacity.
.org 0x02044740
.area 40
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	
	ldrb r1,[r0,r9]
	cmp r1,0x00
	bne 0x0204478c
	b 0x02044768
.endarea

; r0, r1
; r7 contains the class id.
; Handle rendering adjustment.
; This is for the background color.
.org 0x020455f0
.area 56
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_CLASS_UNLOCK
	ldrb r0,[r0,r7]
	cmp r0,0x00
	bne 0x02045628
	mov r0,#0x3
	bl 0x0203b570
	b 0x02045628
.endarea
