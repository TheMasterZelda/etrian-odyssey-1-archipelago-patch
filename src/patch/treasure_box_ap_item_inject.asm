; 0209e404, originally mov r1,r0,lsl#0x3
; Replace the instruction.
.org 0x0209e404
.area 0x4
	mov r1,r0,lsr#0x1c
.endarea

; 0209e40c, originally movs r1,r1,lsr#0x1f
; Replace the instruction.
.org 0x0209e40c
.area 0x4
	nop
.endarea

; Inject new function call into FUN_0209e2d4.
; 0209e414, originally BNE LAB_0209e484.
.org 0x0209e414
.area 0x4
	b LAB_HANDLE_TREASURE_BOX_AP_ITEM
.endarea