extends Control

@export var IsWin = false
@export var TextLabel: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if IsWin:
		TextLabel.text = "Success!
Press [Space] to continue"
	else:
		TextLabel.text = "Oh no!
Press [Space] to continue"
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action("ui_accept"):
		SceneLoader.HideMinigameEndScreen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
