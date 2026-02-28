; Include static variables. These get overriden by the patcher so avoid changing the addresses.
; We have a total of 0x70 reserved memory addresses. Use them well.
; 0x020DC590 to 0x020DC5FF.

; Movement Speed
.org 0x020DC590
.area 1
SV_DAT_MOVEMENT_SPEED:
	.d8 0x4
.endarea

; Level Cap
.org 0x020DC591
.area 1
SV_DAT_LEVEL_CAP:
	.d8 0x46
.endarea

; Floor Limit
.org 0x020DC592
.area 1
SV_DAT_FLOOR_LIMIT:
	.d8 0x1E
.endarea

; Experience Modifier
.org 0x020DC594
.area 4
SV_DAT_EXPERIENCE_MODIFIER:
	.d32 100
.endarea

; Class Available
; Landsknecht
.org 0x020DC5A0
.area 1
SV_DAT_CLASS_LANDSKNECHT:
	.d8 0x1
.endarea
; Survivalist
.org 0x020DC5A1
.area 1
SV_DAT_CLASS_SURVIVALIST:
	.d8 0x1
.endarea
; Protector
.org 0x020DC5A2
.area 1
SV_DAT_CLASS_PROTECTOR:
	.d8 0x1
.endarea
; Dark Hunter
.org 0x020DC5A3
.area 1
SV_DAT_CLASS_DARK_HUNTER:
	.d8 0x1
.endarea
; Medic
.org 0x020DC5A4
.area 1
SV_DAT_CLASS_MEDIC:
	.d8 0x1
.endarea
; Alchemist
.org 0x020DC5A5
.area 1
SV_DAT_CLASS_ALCHEMIST:
	.d8 0x1
.endarea
; Troubadour
.org 0x020DC5A6
.area 1
SV_DAT_CLASS_TROUDABOUR:
	.d8 0x1
.endarea
; Ronin
.org 0x020DC5A7
.area 1
SV_DAT_CLASS_RONIN:
	.d8 0x1
.endarea
; Hexer
.org 0x020DC5A8
.area 1
SV_DAT_CLASS_HEXER:
	.d8 0x1
.endarea

; Class skill order in memory (this is not represented here):
; Landsknecht
; Survivalist
; Protector
; Dark Hunter
; Ronin
; Medic
; Alchemist
; Troubadour
; Hexer

; Skill Available
; Landsknecht's Skills
.org 0x020DC5B0
.area 4
SV_DAT_SKILL_LANDSKNECHT:
	.d32 0x001FFFFF
.endarea
; Survivalist's Skills
.org 0x020DC5B4
.area 4
SV_DAT_SKILL_SURVIVALIST:
	.d32 0x001FFFFF
.endarea
; Protector's Skills
.org 0x020DC5B8
.area 4
SV_DAT_SKILL_PROTECTOR:
	.d32 0x001FFFFF
.endarea
; Dark Hunter's Skills
.org 0x020DC5BC
.area 4
SV_DAT_SKILL_DARK_HUNTER:
	.d32 0x001FFFFF
.endarea
; Medic's Skills
.org 0x020DC5C0
.area 4
SV_DAT_SKILL_MEDIC:
	.d32 0x001FFFFF
.endarea
; Alchemist's Skills
.org 0x020DC5C4
.area 4
SV_DAT_SKILL_ALCHEMIST:
	.d32 0x001FFFFF
.endarea
; Troubadour's Skills
.org 0x020DC5C8
.area 4
SV_DAT_SKILL_TROUDABOUR:
	.d32 0x001FFFFF
.endarea
; Ronin's Skills
.org 0x020DC5CC
.area 4
SV_DAT_SKILL_RONIN:
	.d32 0x001FFFFF
.endarea
; Hexer's Skills
.org 0x020DC5D0
.area 4
SV_DAT_SKILL_HEXER:
	.d32 0x001FFFFF
.endarea

