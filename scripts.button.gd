extends Button

func start_game():
	get_tree().change_scene_to_file("scenes.levels.1.tscn")


func _on_pressed() -> void:
	start_game()

