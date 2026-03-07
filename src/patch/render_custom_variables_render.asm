LAB_RENDER_CUSTOM_VARIABLES_RENDER_PRE_INCREMENT_INDEX:
	bl 0x020174d8
	ldr        r0,[sp,#0x14]
	add        r0,r0,#0x1
	str        r0,[sp,#0x14]

LAB_RENDER_CUSTOM_VARIABLES_RENDER:
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	ldrb r7,[r0,SC_FLOOR_LIMIT]
	ldrb r9,[r0,SC_LEVEL_CAP]

; Initialize
	bl 0x020174F0
	mov r6,r0
; ----

; - Render Text
	bl         0x0201748c
	bl         0x02017528
	rsb        r1,r6,r6, lsl #0x5
	ldr        r2,[@DAT_020badec]
	mov        r0,r1, lsr #0x1f
	smull      r1,r3,r2,r1
	add        r3,r0,r3, asr #0x3
	and        r0,r3,#0xff
	bl         0x020174d8
	mov        r0,#0x8
	str        r0,[sp,#0x0]
	ldr        r1,[sp,#0x98]
	ldr        r3,[sp,#0x14]
	add        r0,sp,#0x40
	mov        r2,#0x0
	bl         0x0204c3b0
	add        r0,sp,#0x40
	mov        r1,#0x0
	stmia      sp,{r0,r1}
	add        r0,r8,#0x1
	str        r0,[sp,#0x8]
	ldr        r0,[sp,#0x98]
	mov r2,#0x8E ; X Coord
	ldr        r0,[r0,#0x0]
	mov r3,#0x17 ; Y Coord
	bl         0x020163b8
; - Render Text

; number rendering
	ldr        r0,[@DAT_NUMBER_TEXT_COLOR]
	bl         0x02017470 ; Set text color
	mov        r0,#0x10
	str        r0,[sp,#0x0]
	add        r0,r8,#0x1
	str        r0,[sp,#0x4]
	ldr        r1,[@DAT_020bae00]
	mov        r0,#0x3
	str        r1,[sp,#0x8]
	mov        r1,#0xB5 ; X Coord
	mov        r2,#0x17 ; Y Coord
	mov        r3,#0x2
	;mov r7,#10
	str        r7,[sp,#0xc]
	bl         0x02061afc
;

; Increment text index
	ldr        r0,[sp,#0x14]
	add        r0,r0,#0x1
	str        r0,[sp,#0x14]
;

; - Render Text
	bl         0x0201748c
	bl         0x02017528
	rsb        r1,r6,r6, lsl #0x5
	ldr        r2,[@DAT_020badec]
	mov        r0,r1, lsr #0x1f
	smull      r1,r3,r2,r1
	add        r3,r0,r3, asr #0x3
	and        r0,r3,#0xff
	bl         0x020174d8
	mov        r0,#0x8
	str        r0,[sp,#0x0]
	ldr        r1,[sp,#0x98]
	ldr        r3,[sp,#0x14]
	add        r0,sp,#0x40
	mov        r2,#0x0
	bl         0x0204c3b0
	add        r0,sp,#0x40
	mov        r1,#0x0
	stmia      sp,{r0,r1}
	add        r0,r8,#0x1
	str        r0,[sp,#0x8]
	ldr        r0,[sp,#0x98]
	mov r2,#0xCB ; X Coord
	ldr        r0,[r0,#0x0]
	mov r3,#0x17 ; Y Coord
	bl         0x020163b8
; - Render Text

; number rendering
	ldr        r0,[@DAT_NUMBER_TEXT_COLOR]
	bl         0x02017470 ; Set text color
	mov        r0,#0x10
	str        r0,[sp,#0x0]
	add        r0,r8,#0x1
	str        r0,[sp,#0x4]
	ldr        r1,[@DAT_020bae00]
	mov        r0,#0x3
	str        r1,[sp,#0x8]
	mov        r1,#0xEB ; X Coord
	mov        r2,#0x17 ; Y Coord
	mov        r3,#0x2
	;mov r7,#10
	str        r9,[sp,#0xc]
	bl         0x02061afc
;



; Finalize
	mov        r0,r6
	bl         0x020174d8
	ldr        r0,[sp,#0x14]
	add        r0,r0,#0x1
	str        r0,[sp,#0x14]
	
	
	add sp,sp,#0x70
	b 0x020badd4

@DAT_020bade0:
	.d32 0x41688900
@DAT_020bade4:
	.d32 0x00008615
@DAT_020bade8:
	.d32 0x00008616
@DAT_020badec:
	.d32 0x4BDA12F7
@DAT_NUMBER_TEXT_COLOR:
	.d32 0xFFFFFFFF
	;.d32 0x59F7D600
@DAT_020bae00:
	.d32 0x020e528c

@DAT_STR_PTR:
	.d32 STR_MAX_FLOOR