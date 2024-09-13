extends Control


func _ready() -> void:
	print_debug("ready")

func _on_juke_box_button_pressed() -> void:
	print_debug("jukebox")
	pass # Replace with function body.


func _on_sausage_button_pressed() -> void:
	SceneLoader.StartSausageMiniGame()
	print_debug("sausage")
	pass # Replace with function body.


func _on_shit_button_pressed() -> void:
	print_debug("shit")
	SceneLoader.StartShitMiniGame()
	pass # Replace with function body.


func _on_frisbee_button_pressed() -> void:
	print_debug("frisbee")
	pass # Replace with function body.
