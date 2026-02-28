; 02071368, originally movs r4,r0
; Inject new function call into FUN_02071354_Character_BattleVictory_Update.
.org 0x02071368
.area 4h
	bl LAB_APPLY_LEVEL_CAP
.endarea
