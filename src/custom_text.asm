.loadtable "encoding.tbl"

STR_END_TEXTBOX_PTR:
	.d32 @STR_END_TEXTBOX

@STR_END_TEXTBOX:
	.string 0x02,0x80

.align 4,0
STR_STAIRS_CANNOT_PROCEED:
	.string "A spacetime distortion prevent you",0x01,0x80,"from proceeding deeper..."

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

.align 4,0
STR_MAX_FLOOR:
	.string "Max Floor:"

.align 4,0
STR_MAX_LEVEL:
	.string "Max Lvl:"