; 02072880, originally mov r0,r8
; Inject new function call into FUN_020726e8.
.org 02072880h
.area 4h
	b LAB_APPLY_EXPERIENCE_MODIFIER
.endarea
