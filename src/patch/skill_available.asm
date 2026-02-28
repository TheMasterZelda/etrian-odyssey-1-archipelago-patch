; r0 contains the Class2Skill pointer.
; r1 can be used safely.
; r2 can be used safely  (written to later).
; r3 can be used safely (written to later).
; r4 contains the executing class pointer.
; r5 contains the index of the loop.
; r6 can be used safely (written to later).
; r7 can be used safely (written to later).
; r8 can be used safely (written to later).
; r9 can be used safely (written to later).
; r10 can be used safely (written to later).
; r11 can be used safely (written to later).
; r12 can be used safely. It is used as the result flag of the current loop iteration.
; lr contains the class skill index.

; Need to write #0xC in r1 before resuming normal execution path.

LAB_APPLY_CUSTOM_SKILL_FLAG:
	mov r6,r0 ; put r0 into a safe register.
	mov r7,lr ; put lr into a safe register.
	ldrb r0,[r4,#0x148]
	bl FUNC_GET_CHARACTER_POINTER_FROM_SLOT_ID
	ldrb r8,[r0,#0x0] ; Load ClassID into r8.
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_SKILL_UNLOCK_OFFSET
	mov r1,SC_SKILL_UNLOCK_CLASS_SIZE
	mla r0,r8,r1,r0
	ldr r1,[r0,0x0] ; Load the flags (32 bits) into r1.
	mov r0,0x1
	lsl r0,r7 ; shift to the desired bitflag
	and r2,r0,r1
	mov r0,r6 ; we can now safely put r0 value back.
	mov lr,r7 ; we can now safely put lr value back.
	mov r1,#0xC ; and do the necessary write for the original execution path.
	cmp r2,#0x0
	bne 0x020a8bd4
	b 0x020a8c7c


; r0 contains the executing class pointer.
; r2 contains the skill index.
; r7 contains the executing class pointer.
; FUN_020a7fdc need r0 to be the executing class pointer and r1 to be #0x3.
; FUN_020153e4 need r0 to be 0x3.

LAB_HANDLE_CANNOT_LEARN_SKILL:
	ldr r8,[r0,0x14c]
	ldrb r8,[r8,0x00]
	bl FUN_GET_CUSTOM_SAVE_CONTEXT_ADDR
	add r0,r0,SC_SKILL_UNLOCK_OFFSET
	mov r1,SC_SKILL_UNLOCK_CLASS_SIZE
	mla r0,r8,r1,r0
	ldr r1,[r0,0x0] ; Load the flags (32 bits) into r1.
	mov r0,0x1
	lsl r0,r2 ; shift to the desired bitflag
	and r1,r0,r1
	cmp r1,#0x00
	beq 0x020a7f90
	mov r0,r7
	mov r1,0x3
	b 0x020a7f80
	