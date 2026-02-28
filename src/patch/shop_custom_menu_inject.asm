; Override some initialization value.

.org 0x02085678
.area 4
	mov r0,#0x5
.endarea

.org 0x020856a8
.area 4
	mov r0,#0x36
.endarea

; Override the switch case max value.
.org 0x020856d0
.area 4
	cmp r1,#0x4
.endarea

; This overrides a switch case, so its fairly sensitive.

.org 0x020856dc
	b @LAB_CASE_0
	b 0x02085714
	b LAB_SHOP_CUSTOM_MENU_CASE_2
	b 0x0208574c
	b 0x02085770
@LAB_CASE_0:
	b LAB_SHOP_CUSTOM_MENU_CASE_0


; Override another switch case.
.org 0x0208579c
.area 4
	b LAB_SHOP_CUSTOM_MENU_2_CASE_2
.endarea