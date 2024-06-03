extends Node2D
@export var blink : Sprite2D
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = time + delta
	if (time > 1):
		blink.modulate = Color(1,1,1,0.3)
		if (time > 1.5):
			time = 0
	else:
		blink.modulate = Color(1,1,1,0.4)
	pass
