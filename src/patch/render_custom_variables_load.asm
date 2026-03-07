LAB_RENDER_CUSTOM_VARIABLES_LOAD:
	ldr r1,[@DAT_MAX_FLOOR_STR_PTR]
	mov r0,r10
	bl 0x0204bbf0
	mov r10,r0
	ldr r1,[@DAT_MAX_LEVEL_STR_PTR]
	mov r0,r10
	bl 0x0204bbf0
	; Complete the replaced instructions
	cmp r9,#0x0
	addeq sp,sp,#0x7c
	b 0x020ba670

@DAT_MAX_FLOOR_STR_PTR:
	.d32 STR_MAX_FLOOR

@DAT_MAX_LEVEL_STR_PTR:
	.d32 STR_MAX_LEVEL