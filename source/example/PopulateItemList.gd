extends ItemList

func _ready():
	# Populate Item List with dummy data
	for i in range(50):
		add_item("Item #%02d" % (i + 1))
