
LAB_SHOP_CUSTOM_MENU_CASE_0:
	bl 0x02088af4
	mov r1,0x0
	b  0x020856f4

LAB_SHOP_CUSTOM_MENU_CASE_2:
	bl 0x02088af4
	mov r4,r0
	mov r0,r5
	bl 0x02088af4
	mov r1,r0
	mov r0,r4
	bl 0x0203d56c
	ldr r1,[@DAT_FFFF]
	mov r0,#0xe
	bl 0x0203d56c
	bl 0x0203d6e0
	b 0x02085774

@DAT_FFFF:
	.d32 0xFFFF

LAB_SHOP_CUSTOM_MENU_2_CASE_2:
	mov r8,r4
	mov r0,#0x400
	bl FUNC_MALLOC
	mov r7,r0
	mov r6,r7
	mov r1,#0x0
	mov r2,#0x400
	bl FUNC_MEMSET
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	mov r5,r0
	bl FUNC_GET_INVENTORY_ITEM_COUNT
	mov r1,#60
	sub r4,r1,r0
	;ldr r3,[r5,SC_MONEY_RECEPTION_OFFSET] Not doing this yet
	cmp r4,#0x0
	beq @LAB_INVENTORY_IS_FULL
	mov r0,#0x1
	str r0,[r5,SC_SYNCHRONIZATION_SAFEGUARD]
	bl @LAB_GET_NEXT_RECEPTION_ITEM
	cmp r0,#0x0
	beq @LAB_NO_ITEM_TO_RECEIVE
	
@@LAB_LOOP:
	mov r4,r0
	bl FUNC_ADD_ITEM_TO_INVENTORY
	cmp r0,#0x1
	mov r1,#0x0
	bne @LAB_INVENTORY_IS_FULL
	strh r1,[r3]
	ldr r0,[@STR_RECEIVE_ITEM_RECEIVED_PTR]
	bl @LAB_APPEND_STRING
	mov r0,#0x11
	mov r1,#0x0
	bl FUNC_GET_MESSAGE_TABLE_POINTER
	mov r1,r4
	bl FUNC_GET_MESSAGE_TABLE_ENTRY
	bl @LAB_APPEND_STRING
	ldr r0,[STR_END_TEXTBOX_PTR]
	bl @LAB_APPEND_STRING
	bl @LAB_GET_NEXT_RECEPTION_ITEM
	cmp r0,#0x0
	bne @@LAB_LOOP
	b @LAB_FINALIZE
	
	ldr r0,[@STR_RECEIVE_ITEM_ITEMS_AVAILABLE_PTR]
	bl @LAB_APPEND_STRING
	ldr r0,[STR_END_TEXTBOX_PTR]
	bl @LAB_APPEND_STRING
	
@LAB_NO_ITEM_TO_RECEIVE:
	ldr r0,[@STR_RECEIVE_ITEM_NO_ITEM_PTR]
	bl @LAB_APPEND_STRING
	ldr r0,[STR_END_TEXTBOX_PTR]
	bl @LAB_APPEND_STRING
	b @LAB_FINALIZE
	
@LAB_INVENTORY_IS_FULL:
	ldr r0,[@STR_RECEIVE_ITEM_NO_SPACE_PTR]
	bl @LAB_APPEND_STRING
	ldr r0,[STR_END_TEXTBOX_PTR]
	bl @LAB_APPEND_STRING
@LAB_FINALIZE:
	mov r0,#0x0
	str r0,[r5,SC_SYNCHRONIZATION_SAFEGUARD]
	mov r2,#0x1
	mov r3,r7
	mov r1,#0x0
	mov r0,r8
	bl 0x02088af4 ; Get attach parameter for textbox
	bl 0x0203c760 ; Create Textbox object
	mov r0,r7
	bl FUNC_FREE
	mov r4, r8
	b 0x020857b4

@LAB_GET_NEXT_RECEPTION_ITEM:
	add r3,r5,SC_ITEM_RECEPTION_OFFSET
	mov r1,0x00
	mov r2,0x00
@@LAB_LOOP:
	ldrh r0,[r3]
	cmp r0,#0x0
	bne @LAB_END_LOOP
	add r1,r1,#0x1
	add r3,r3,#0x2
	cmp r1,SC_ITEM_RECEPTION_ARRAY_SIZE
	blt @@LAB_LOOP

@LAB_END_LOOP:
	bx lr

; r7 Pointer start of destination
; r6 Pointer current destination
; r0 Pointer source

; STR_END_TEXTBOX_PTR
@LAB_APPEND_STRING:
	stmdb sp!,{r4,r5,lr}
	mov r4,r0
	bl FUNC_WCSLEN
	mov r5,r0
	mov r2,r0,lsl#0x1
	mov r1,r6
	mov r0,r4
	bl FUNC_WCSNCAT
	add r6,r6,r5,lsl#0x1
	ldmia sp!,{r4,r5,pc}


@STR_RECEIVE_ITEM_NO_SPACE_PTR:
	.d32 STR_RECEIVE_ITEM_NO_SPACE

@STR_RECEIVE_ITEM_ITEMS_AVAILABLE_PTR:
	.d32 STR_RECEIVE_ITEM_ITEMS_AVAILABLE

@STR_RECEIVE_ITEM_NO_ITEM_PTR:
	.d32 STR_RECEIVE_ITEM_NO_ITEM

@STR_RECEIVE_ITEM_RECEIVED_PTR:
	.d32 STR_RECEIVE_ITEM_RECEIVED