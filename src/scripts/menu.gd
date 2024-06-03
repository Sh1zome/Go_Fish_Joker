extends Control
@export var disclaimer : Control
@export var text : Label
@export var fade : ColorRect
var time = 0.0
var fade_time = 1.5
var fade2_time = 16.0

# Called when the node enters the scene tree for the first time.
func _ready():
	disclaimer.visible = true
	fade.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = time + delta
	if (time <= 1.5):
		fade.modulate = Color(1,1,1,fade_time-time)
	 
	if (time > 18): 
		fade.visible = false
	elif (time > 16):
		fade.modulate = Color(1,1,1,1-(time-16)/2)
		disclaimer.visible = false
	elif (time > 8 ):
		fade.modulate = Color(1,1,1,time/8-1)
	
	if (time > 3.8):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play responsibly."
	elif (time > 3.3):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play responsibly_"
	elif (time > 3.2):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play responsibl "
	elif (time > 3.1):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play responsib_"
	elif (time > 3.0):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play responsi "
	elif (time > 2.9):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play respons_"
	elif (time > 2.8):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play respon "
	elif (time > 2.7):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play respo_"
	elif (time > 2.6):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play resp "
	elif (time > 2.5):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play res_"
	elif (time > 2.4):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play re "
	elif (time > 2.3):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play r_"
	elif (time > 2.2):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please play "
	elif (time > 2.0):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please pla_"
	elif (time > 1.9):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please pl "
	elif (time > 1.8):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please p_"
	elif (time > 1.7):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Please "
	elif (time > 1.5):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Pleas_"
	elif (time > 1.4):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Plea "
	elif (time > 1.3):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Ple_"
	elif (time > 1.2):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

Pl "
	elif (time > 1.1):
		text.text = "This game is created solely for entertainment purposes. Any coincidences or resemblances to real events or persons are purely coincidental. The game does not intend to offend anyone or cause harm. It may contain flashes, scenes of violence, blood, cruelty, and profanity. Therefore, it is recommended for players over 18 years old only. 

P_"

	
