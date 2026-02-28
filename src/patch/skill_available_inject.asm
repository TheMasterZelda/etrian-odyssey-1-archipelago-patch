; 020a8bcc is originally mov r1,#0xC
; 020a8bd0 is originally add lr,r5,r2
.org 0x020a8bcc
.area 8
	add lr,r5,r2
	b LAB_APPLY_CUSTOM_SKILL_FLAG
.endarea

; The game softlocks if the player try to learn a default skill that is locked.
; So fix this softlock here.

; 020a7f7c is originally mov r1,0x3
.org 0x020a7f7c
.area 4
	b LAB_HANDLE_CANNOT_LEARN_SKILL
.endarea