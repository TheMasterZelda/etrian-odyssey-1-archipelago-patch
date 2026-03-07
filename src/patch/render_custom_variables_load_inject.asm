
.org 0x020ba628
	beq 0x020ba66c


.org 0x020ba65c
.area 20
	mov r10,r0
	add r0,r9,#0x1
	mov r0,r0,lsl#0x18
	mov r9,r0,asr#0x18
	b LAB_RENDER_CUSTOM_VARIABLES_LOAD
.endarea
