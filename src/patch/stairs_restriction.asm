
LAB_STAIRS_RESTRICTION:
	bl FUNC_GET_SAVE_CONTEXT_PTR
	ldrb r1,[r0,0x64e]
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldrb r2,[r0,SC_FLOOR_LIMIT]
	add r1,r1,#0x1
	cmp r1,r2
	blt @LAB_RESUME_NORMAL_EXECUTION

	; Floor is restricted, cannot proceed further!
	add r1,r4,#0x2000
	ldrb r2,[r1,#0xa20] ; Load PlayerInteractState
	cmp r2,#0x0
	beq @LAB_SHOW_TEXTBOX
	
	add r0,r4,#0x29c0
	bl 0x0203c7d0 ; Checks if the textbox is closed.
	cmp r0,#0x0
	beq @LAB_FINALIZE
	;mov r0,#0x1
	;strb r0,[r1,#0xa20]
	mov r0,r4
	bl 0x02092b60
	mov r0,r4
	mov r1,#0x1
	bl 0x02076388 ; SetPlayerState
	b @LAB_FINALIZE

@LAB_SHOW_TEXTBOX:
	mov r0,#0x1
	strb r0,[r1,#0xa20]
	
	add r0,r4,#0x29c0
	mov r1,#0x1
	str r1,[r0,#0x0]
	
	; Can't proceed to the next floor.
	ldr r0,[@DAT_FFFF]
	mov r1,0x0
	mov r2,0x0
	ldr r3,[@STR_CANT_PROCEEDPTR]
	mov r4,0x7
	bl 0x0203c760 ; Instanciate Object Mem0x4 / Create Textbox object
@LAB_FINALIZE:
	b 0x0202b9d4


@LAB_RESUME_NORMAL_EXECUTION:
	mov r0,#0x11
	b 0x0202b998


@DAT_FFFF:
	.d32 0xFFFF
@STR_CANT_PROCEEDPTR:
	.d32 STR_STAIRS_CANNOT_PROCEED
