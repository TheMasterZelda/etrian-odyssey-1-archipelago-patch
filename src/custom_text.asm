.loadtable "encoding.tbl"

STR_END_TEXTBOX_PTR:
	.d32 @STR_END_TEXTBOX

@STR_END_TEXTBOX:
	.string 0x02,0x80

.align 4,0
STR_STAIRS_CANNOT_PROCEED:
	.string "Can";'t proceed down dingus"

.align 4,0
STR_RECEIVE_ITEM_NO_SPACE:
	.string "Not enough inventory space..."

.align 4,0
STR_RECEIVE_ITEM_ITEMS_AVAILABLE:
	.string "New items available!"

.align 4,0
STR_RECEIVE_ITEM_NO_ITEM:
	.string "No new items available."

.align 4,0
STR_RECEIVE_ITEM_RECEIVED:
	.string "Obtained "
