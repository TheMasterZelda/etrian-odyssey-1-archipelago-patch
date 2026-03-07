
.org 0x020bac5c
.area 8
	beq 0x020badd0
	mov r0,r0
.endarea

.org 0x020badcc
.area 4
	b LAB_RENDER_CUSTOM_VARIABLES_RENDER_PRE_INCREMENT_INDEX
.endarea

.org 0x020badd0
.area 4
	b LAB_RENDER_CUSTOM_VARIABLES_RENDER
.endarea