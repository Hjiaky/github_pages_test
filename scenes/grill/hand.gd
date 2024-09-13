extends Node2D


var speed = 200  # pixels per second
var direction = 1
func _ready():
	# Set the initial position of the sprite to the left side of the screen
	position.x = 0

func _process(delta):
	# Move the sprite to the right
	position.x += (direction*speed) * delta
	
	# If the sprite moves off-screen, reset its position to the left
	if position.x > get_viewport_rect().size.x:
		direction = -1
	if position.x < get_viewport_rect().position.x:
		direction = 1
