LAB_HANDLE_TREASURE_BOX_AP_ITEM:
	cmp r1,#0x3
	beq 0x0209e484 ; If Item.
	cmp r1,#0x2
	beq 0x0209e418 ; If Money.
	cmp r1,#0x4
	beq @LAB_HANDLE_OTHER_WORLD ; If other world item.
	ldr r1,[@LAB_THIS_WORLD_ITEM_TEXT_ID]
	b @LAB_FINALIZE
@LAB_HANDLE_OTHER_WORLD:
	ldr r1,[@LAB_OTHER_WORLD_ITEM_TEXT_ID]
@LAB_FINALIZE:
	add r0,r6,#0x29c0
	bl 0x0209d4d4 ; FUN_0209d4d4
	b 0x0209e4ac ; set flag and continue execution as if it was a regular item.

@LAB_OTHER_WORLD_ITEM_TEXT_ID:
	.d32 457

@LAB_THIS_WORLD_ITEM_TEXT_ID:
	.d32 458