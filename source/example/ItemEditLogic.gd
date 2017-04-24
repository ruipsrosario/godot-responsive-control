extends Panel

var itemListNode
var itemEditTextNode
var itemEditDescriptionNode

func _ready():
	itemListNode = get_node("ItemListSection/ItemList")
	itemEditTextNode = get_node("ItemEditSection/ItemText/LineEdit")
	itemEditDescriptionNode = get_node("ItemEditSection/Description/TextEdit")

	# Populate Item List with dummy data
	for i in range(50):
		itemListNode.add_item("Item #%02d" % (i + 1))
		itemListNode.set_item_metadata(i, "This is a description")

	itemListNode.connect("item_selected", self, "updateItemEditSection")
	itemEditTextNode.connect("text_changed", self, "updateItemText")
	itemEditDescriptionNode.connect("text_changed", self, "updateItemDescription")

	itemListNode.select(0)

func updateItemEditSection(index):
	itemEditTextNode.set_text(itemListNode.get_item_text(index))
	itemEditDescriptionNode.set_text(itemListNode.get_item_metadata(index))

func updateItemText(text):
	var index = itemListNode.get_selected_items()[0]
	itemListNode.set_item_text(index, text)

func updateItemDescription():
	var index = itemListNode.get_selected_items()[0]
	itemListNode.set_item_metadata(index, itemEditDescriptionNode.get_text())
