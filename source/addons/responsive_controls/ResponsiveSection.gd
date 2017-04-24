tool
extends Control

var ResponsiveSizing = preload("ResponsiveSizing.gd")
var sizingNodes = [ ]
var parentControl

func _ready():
	refreshParent()
	refreshSizings()
	processParentResizing()

# Function to refresh the parentControl with the parent Control node of the current node
# NOTE - This function should be manually called if this node is either unparented / reparented
func refreshParent():
	parentControl = get_parent()
	if parentControl != null && parentControl extends Control:
		parentControl.connect("resized", self, "processParentResizing")
	else:
		parentControl = null

# Dynamically chooses the Responsive Sizing node that better relates to the current size of the
# parent Control and applies it
func processParentResizing():
	if parentControl != null:
		var parentSize = parentControl.get_size()
		for sizingNode in sizingNodes:
			if sizingNode.isEligible(parentSize):
				sizingNode.applyTo(self)
				break

# Function to refresh the sizingNodes array with all the Responsive Sizing children
# NOTE - This function should be manually called if the children of the current node are changed
#        (e.g. add or remove Responsive Sizing children)
func refreshSizings():
	sizingNodes.clear()
	for child in get_children():
		if child extends ResponsiveSizing:
			sizingNodes.append(child)
	sizingNodes.sort_custom(self, "sortSizingNodes")

# Sorts the Responsive Sizing children nodes from largest to smallest (prioritizing width)
func sortSizingNodes(node1, node2):
	var nodeSize1 = node1.get_size()
	var nodeSize2 = node2.get_size()
	if nodeSize1.width != nodeSize2.width:
		return nodeSize1.width > nodeSize2.width
	return nodeSize1.height > nodeSize2.height
