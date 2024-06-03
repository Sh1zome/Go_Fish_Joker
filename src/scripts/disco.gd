extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var normalized_pos: Vector2 = Vector2(get_viewport().get_mouse_position().x / get_viewport_rect().size.x, (get_viewport().get_mouse_position().y) / get_viewport_rect().size.y);
	material.set_shader_parameter("player_position", normalized_pos);
	pass
