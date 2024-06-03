extends TextureRect

@export var speed = 0.005
var toBottom = true
var toTop = false
var toLeft = true # -0.17453299462795
var toRight = false # 0.17453299462795
var time = 0.0
var music_time = 0.0
var time_to_normal = 1.0
@export var music : AudioStreamPlayer2D

func lerp_angle(from, to, weight):
	return from + short_angle_dist(from, to) * weight

func short_angle_dist(from, to):
	var max_angle = PI * 2
	var difference = fmod(to - from, max_angle)
	return fmod(2 * difference, max_angle) - difference

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	music_time = music.get_playback_position()
	
	if (time_to_normal > 1):
		time_to_normal -= delta * 0.4
		
	if (position.y >= 75):
		toTop = true
		toBottom = false
	elif (position.y <= 50):
		toTop = false
		toBottom = true

	if (rotation >= 0.170):
		toLeft = true
		toRight = false
	elif (rotation <= -0.170):
		toLeft = false
		toRight = true

	if (toBottom):
		position = position.lerp(Vector2(0,155), speed)
	elif (toTop):
		position = position.lerp(Vector2(0,-30), speed)

	if (toLeft):
		rotation = lerp_angle(rotation, -0.300, speed * 4)
	elif (toRight):
		rotation = lerp_angle(rotation, 0.300, speed * 4)

	if (music_time >= 18.3 && music_time <= 18.4 ||
		music_time >= 19.1 && music_time <= 19.2 ||
		music_time >= 19.4 && music_time <= 19.5 ||
		music_time >= 20.0 && music_time <= 20.1 ||
		music_time >= 21.2 && music_time <= 21.3 ||
		music_time >= 21.7 && music_time <= 21.8 ||
		music_time >= 22.0 && music_time <= 22.1 ||
		music_time >= 22.6 && music_time <= 22.7 ||
		music_time >= 22.9 && music_time <= 23.0 ||
		music_time >= 23.8 && music_time <= 23.9 ||
		music_time >= 24.0 && music_time <= 24.1 ||
		music_time >= 24.6 && music_time <= 24.7 ||
		music_time >= 25.8 && music_time <= 25.9 ||
		music_time >= 26.3 && music_time <= 26.4 ||
		music_time >= 26.6 && music_time <= 26.7 ||
		music_time >= 27.2 && music_time <= 27.3 ||
		music_time >= 27.5 && music_time <= 27.6 ||
		music_time >= 28.3 && music_time <= 28.4 ||
		music_time >= 28.6 && music_time <= 28.7 ||
		music_time >= 29.2 && music_time <= 29.3 ||
		music_time >= 30.3 && music_time <= 30.4 ||
		music_time >= 30.9 && music_time <= 31.0 ||
		music_time >= 31.2 && music_time <= 31.3 ||
		music_time >= 31.7 && music_time <= 31.8 ||
		music_time >= 32.0 && music_time <= 32.1 ||
		music_time >= 32.9 && music_time <= 33.0 ||
		music_time >= 33.2 && music_time <= 33.3 ||
		music_time >= 33.7 && music_time <= 33.8 ||
		music_time >= 34.9 && music_time <= 35.0 ||
		music_time >= 35.5 && music_time <= 35.6 ||
		music_time >= 35.7 && music_time <= 35.8 ||
		music_time >= 36.0 && music_time <= 36.1 ||
		music_time >= 36.2 && music_time <= 36.3 ||
		music_time >= 36.3 && music_time <= 36.4 ||
		music_time >= 36.4 && music_time <= 36.5):
		scale = Vector2(1.3,1.3)
		time_to_normal = 1.3
	else:
		scale = Vector2(time_to_normal,time_to_normal)
