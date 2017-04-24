tool
extends Control

# Minimum size the parent Control must have in order to trigger this Responsive Sizing
export(Vector2) var minimumParentSize = Vector2()

# Whether or not this Responsive Sizing is visible in the set size
export(bool) var isVisible = true

# Checks if this Responsive Sizing is eligible under the specified size
func isEligible(size):
	return size.width >= minimumParentSize.width && size.height >= minimumParentSize.height

# Applies this Responsive Sizing to the specified Control
func applyTo(control):
	if isVisible != control.is_visible():
		if isVisible:
			control.show()
		else:
			control.hide()
	
	control.set_h_size_flags(get_h_size_flags())
	control.set_v_size_flags(get_v_size_flags())
	control.set_scale(get_scale())
	for margin in [ MARGIN_BOTTOM, MARGIN_TOP, MARGIN_RIGHT, MARGIN_LEFT ]:
		control.set_anchor(margin, get_anchor(margin))
		control.set_margin(margin, get_marginr(margin))
