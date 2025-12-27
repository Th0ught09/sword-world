extends TextureRect




func _on_gui_input(event:InputEvent) -> void:
	if event.is_action("click"):
		print("works")
		get_tree().change_scene("res://main_scene.tcsn")

	pass # Replace with function body.
