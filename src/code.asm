; Set the nintendo ds directive.
.nds
.relativeinclude on

; Include globals
.include "label.asm"
.include "save_context_offsets.asm"

; Open the primary file to patch.
.open "..\input.bin","..\arm9.bin",0x02000000

; Include injections here. Injections are patch that modify already existing asm.

.include "patch\movement_speed_inject.asm"
.include "patch\experience_modifier_inject.asm"
.include "patch\treasure_box_ap_item_inject.asm"
.include "patch\level_cap_inject.asm"
.include "patch\class_selection_inject.asm"
.include "patch\skill_available_inject.asm"
.include "patch\stairs_restriction_inject.asm"
.include "patch\shop_custom_menu_inject.asm"
.include "patch\new_save_inject.asm"

; 0x020DC590 to 0x020DC5FF is reserved for static variables.
.include "static_variables.asm"

; Include all subpatch here.
.org 0x020DC600
.area 0xC3F
	.include "patch\get_custom_save_context_addr.asm"
	.include "patch\experience_modifier.asm"
	.include "patch\treasure_box_ap_item.asm"
	.include "patch\level_cap.asm"
	.include "patch\skill_available.asm"
	.include "patch\stairs_restriction.asm"
	.include "patch\shop_custom_menu.asm"
	.include "patch\new_save.asm"
	
	.include "custom_text.asm" ; Keep this at the end, since it can misalign instructions.
.endarea

; Finalize patching.
.close