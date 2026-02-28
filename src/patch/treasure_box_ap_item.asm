LAB_HANDLE_TREASURE_BOX_AP_ITEM:
	cmp r1,#0x3
	beq 0x0209e484 ; If Item.
	cmp r1,#0x4
	bne 0x0209e418 ; If not AP Item.
	mov r1,#0x1c4
	add r0,r6,#0x29c0
	bl 0x0209d4d4 ; FUN_0209d4d4
	b 0x0209e4ac ; set flag and continue execution as if it was a regular item.