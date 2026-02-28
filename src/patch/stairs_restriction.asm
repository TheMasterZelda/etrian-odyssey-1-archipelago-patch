LAB_STAIRS_RESTRICTION:
	cmp r0,#0x1
	bne @LAB_RESUME_NORMAL_EXECUTION
	mov r3,r0
	ldr r0,[r0,0x04]
	ldrb r1,[r0,0x64e]
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldr r2,[r0,SC_FLOOR_LIMIT]
	add r1,r1,#0x1
	mov r0,r3
	cmp r1,r2
	blt @LAB_RESUME_NORMAL_EXECUTION
	; Can't proceed to the next floor.
	ldr r0,[@DAT_FFFF]
	mov r1,0x0
	mov r2,0x0
	ldr r3,[@STR_CANT_PROCEEDPTR]
	bl 0x0203c760
	mov r0,#0x1
	b 0x02096ac0
	
@LAB_RESUME_NORMAL_EXECUTION:
    bl 0x02047794
	b 0x02096a20

@DAT_FFFF:
	.d32 0xFFFF
@STR_CANT_PROCEEDPTR:
	.d32 STR_STAIRS_CANNOT_PROCEED
