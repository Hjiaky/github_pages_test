extends Control

class_name NoShitMinigame

@export var SequenceLength = 3
@export var YellowPaw: TextureButton
@export var BluePaw: TextureButton
@export var RedPaw: TextureButton
@export var GreenPaw: TextureButton

enum SequenceStep {yellow= 0,green=1,blue=2,red=3}
var sequence: Array[SequenceStep]
var player_sequence: Array[SequenceStep]
var sequence_played = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	darken_paws()
	generate_sequence()
	play_sequence()
	sequence_played = true
	pass # Replace with function body.

func darken_paws():
	YellowPaw.self_modulate = YellowPaw.self_modulate.darkened(.5)
	BluePaw.self_modulate = BluePaw.self_modulate.darkened(.5)
	RedPaw.self_modulate = RedPaw.self_modulate.darkened(.5)
	GreenPaw.self_modulate = GreenPaw.self_modulate.darkened(.5)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_paw_color(paw: SequenceStep, active):
	var paw_node:TextureButton
	match paw:
		SequenceStep.yellow:
			paw_node = YellowPaw
		SequenceStep.blue:
			paw_node = BluePaw
		SequenceStep.red:
			paw_node = RedPaw
		SequenceStep.green:
			paw_node = GreenPaw
	if active:
		paw_node.self_modulate = paw_node.self_modulate.lightened(1)
	else:
		paw_node.self_modulate = paw_node.self_modulate.darkened(.5)
	pass
func generate_sequence():
	sequence = []
	for step in SequenceLength:
		match randi() % 4:
			SequenceStep.yellow: sequence.append(SequenceStep.yellow)
			SequenceStep.blue: sequence.append(SequenceStep.blue)
			SequenceStep.red: sequence.append(SequenceStep.red)
			SequenceStep.green: sequence.append(SequenceStep.green)
	pass
func play_sequence():
	for step in sequence:
		set_paw_color(step,true)
		await get_tree().create_timer(1.0).timeout
		set_paw_color(step,false)
		await get_tree().create_timer(.1).timeout

	pass
func click_paw(step:SequenceStep):
	player_sequence.append(step)
	check_sequence()
	pass
func check_sequence():
	print_debug(player_sequence)
	print_debug(sequence)
	if(player_sequence.size() >= SequenceLength):
		if(player_sequence == sequence):
			complete_minigame()
		else:
			loose_minigame()
func complete_minigame():
	SceneLoader.ShowMingameEnd(true)
func loose_minigame():
	SceneLoader.ShowMingameEnd(false)
func on_yellow_paw_click():
	click_paw(SequenceStep.yellow)
func on_red_paw_click():
	click_paw(SequenceStep.red)
func on_blue_paw_click():
	click_paw(SequenceStep.blue)
func on_green_paw_click():
	click_paw(SequenceStep.green)


func _on_back_button_pressed() -> void:
	SceneLoader.ExitMinigame()
	pass # Replace with function body.

	
	
func _on_y_paw_button_down() -> void:
	set_paw_color(SequenceStep.yellow, true)
func _on_y_paw_button_up() -> void:
	set_paw_color(SequenceStep.yellow, false)
	
func _on_b_paw_button_down() -> void:
	set_paw_color(SequenceStep.blue, true)
func _on_b_paw_button_up() -> void:
	set_paw_color(SequenceStep.blue, false)
	
func _on_r_paw_button_down() -> void:
	set_paw_color(SequenceStep.red, true)
func _on_r_paw_button_up() -> void:
	set_paw_color(SequenceStep.red, false)
	
func _on_g_paw_button_down() -> void:
	set_paw_color(SequenceStep.green, true)
func _on_g_paw_button_up() -> void:
	set_paw_color(SequenceStep.green, false)
