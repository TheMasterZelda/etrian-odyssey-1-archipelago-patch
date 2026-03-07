LAB_ELEVATOR_RESTRICTION_2:
	
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldrb r0,[r0,SC_FLOOR_LIMIT]
	sub r0,r0,#20
	cmp r0,#0x5
	bge @LAB_RETURN_2_FULL
	add r0,r4,#0x29c0
	mov r2,#0x1
	b 0x020aef28
	
@LAB_RETURN_2_FULL:
	add r0,r4,#0x29c0
	mov r2,#0x2
	b 0x020aef28
	


LAB_ELEVATOR_RESTRICTION_4:
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldrb r0,[r0,SC_FLOOR_LIMIT]
	sub r0,r0,#20
	cmp r0,#0x1
	bge @LAB_CMP_TO_4
	mov r0,#0x1
@LAB_CMP_TO_4:
	cmp r0,#0x4
	blt @LAB_FINALIZE_4
	mov r0,#0x4
@LAB_FINALIZE_4:
	mov r2,r0
	add r0,r4,#0x29c0
	b 0x020aef14