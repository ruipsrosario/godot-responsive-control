tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("ResponsiveSection", "Control", preload("ResponsiveSection.gd"), preload("icon_responsive_section.tex"))

func _exit_tree():
	remove_custom_type("ResponsiveSection")
