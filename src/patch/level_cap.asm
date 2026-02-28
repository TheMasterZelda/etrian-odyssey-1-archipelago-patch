LAB_APPLY_LEVEL_CAP:
	movs r4,r0
	beq 0x0207136C
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldrb r0,[r0,SC_LEVEL_CAP] ; Level cap
	ldrb r1,[r4,0x48] ; Load character level.
	cmp r1,r0
	bcc @LAB_RETURN
	mov r0,0x00
	str r0,[r5,0x10]
	str r0,[r5,0x14]
@LAB_RETURN:
	movs r0,r4
	b 0x0207136C