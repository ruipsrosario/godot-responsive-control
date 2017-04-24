tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ResponsiveSection", "Control", preload("ResponsiveSection.gd"), preload("icon_responsive_section.tex"))
	add_custom_type("ResponsiveSizing", "Control", preload("ResponsiveSizing.gd"), preload("icon_responsive_sizing.tex"))

func _exit_tree():
	remove_custom_type("ResponsiveSizing")
	remove_custom_type("ResponsiveSection")
