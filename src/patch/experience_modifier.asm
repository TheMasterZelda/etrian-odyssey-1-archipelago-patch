LAB_APPLY_EXPERIENCE_MODIFIER:
	ldr r0,[SV_DAT_EXPERIENCE_MODIFIER]
	mul r0,r8,r0
	umull r8,r0,r0,r11
	mov r0,r0,lsr #0x5
	b 02072884h
