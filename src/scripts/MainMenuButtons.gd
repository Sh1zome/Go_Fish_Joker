extends VBoxContainer
@export var play : Button
@export var settings : Button
@export var exit : Button
@export var new_game : Button
@export var load_game : Button
@export var back : Button
@export var settings_menu : Control
@export var back_from_settings : Button
@export var fullscreen_toggle : Button
@export var vsync_toggle : Button
@export var resolution_menu : OptionButton
@export var volume_slider : HSlider
@export var ui_hover_player : AudioStreamPlayer2D
@export var ui_click_player : AudioStreamPlayer2D
var cfg_path = "user://config.ini" 
var resolution = Vector2i(1152, 648)

# Create new ConfigFile object.
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if (new_game.disabled):
		new_game.use_parent_material = false
	if (load_game.disabled):
		load_game.use_parent_material = false
	volume_slider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(0)))
	
	var err = config.load(cfg_path)

	# If the file didn't load, ignore it.
	if err == OK:
		for section in config.get_sections():
			
			if (config.get_value(section, "fullscreen") == "true"):
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
				
			elif (config.get_value(section, "fullscreen") == "false"):
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				
				
			if (config.get_value(section, "vsync") == "true"):
				DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
				
			elif (config.get_value(section, "vsync") == "false"):
				DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
				
				
			if (typeof(config.get_value(section, "resolution_index")) != TYPE_NIL):
				resolution_menu.selected = config.get_value(section, "resolution_index")
				
			if (typeof(config.get_value(section, "resolution")) != TYPE_NIL):
				DisplayServer.window_set_size(config.get_value(section, "resolution"))
				resolution = config.get_value(section, "resolution")
			
			if (typeof(config.get_value(section, "volume")) != TYPE_NIL):
				AudioServer.set_bus_volume_db(0, linear_to_db(config.get_value(section, "volume")))
				volume_slider.set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(0)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _hover(button):
	button.scale = Vector2(1.1,1.1)
	button.position = Vector2(button.position.x - 10, button.position.y - 5)
	ui_hover_player.play()

func _click(button):
	ui_click_player.play()

func _unhover(button):
	button.scale = Vector2(1,1)
	button.position = Vector2(button.position.x + 10, button.position.y + 5)
	

func _on_play_mouse_entered():
	_hover(play)


func _on_play_mouse_exited():
	_unhover(play)


func _on_settings_mouse_entered():
	_hover(settings)
	


func _on_settings_mouse_exited():
	_unhover(settings)


func _on_exit_mouse_entered():
	_hover(exit)


func _on_exit_mouse_exited():
	_unhover(exit)

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior

func _on_exit_pressed():
	_click(exit)
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_settings_pressed():
	_click(settings)
	settings_menu.visible = true
	if (config.get_value("Settings", "fullscreen") == "true"):
		fullscreen_toggle.set_pressed_no_signal(true)
	if (config.get_value("Settings", "vsync") == "true"):
		vsync_toggle.set_pressed_no_signal(true)


func _on_button_pressed():
	_click(back_from_settings)
	settings_menu.visible = false
	
	if (fullscreen_toggle.button_pressed):
		config.set_value("Settings", "fullscreen", "true")
	else:
		config.set_value("Settings", "fullscreen", "false")
	
	if (vsync_toggle.button_pressed):
		config.set_value("Settings", "vsync", "true")
	else:
		config.set_value("Settings", "vsync", "false")
		
	config.save(cfg_path)

func _fullscreen_toggled():
	_click(fullscreen_toggle)
	if (fullscreen_toggle.button_pressed):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(resolution)


func _vsync_toggled():
	_click(vsync_toggle)
	if (vsync_toggle.button_pressed):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_change_resolution(index):
	_click(resolution_menu)
	if (index == 0):
		DisplayServer.window_set_size(Vector2i(1920, 1080))
		resolution = Vector2i(1920, 1080)
	elif (index == 1):
		DisplayServer.window_set_size(Vector2i(1600, 900))
		resolution = Vector2i(1600, 900)
	elif (index == 2):
		DisplayServer.window_set_size(Vector2i(1280, 720))
		resolution = Vector2i(1280, 720)
	elif (index == 3):
		DisplayServer.window_set_size(Vector2i(1152, 648))
		resolution = Vector2i(1152, 648)
	elif (index == 4):
		DisplayServer.window_set_size(Vector2i(1024, 576))
		resolution = Vector2i(1024, 576)
	elif (index == 5):
		DisplayServer.window_set_size(Vector2i(960, 540))
		resolution = Vector2i(960, 540)
	elif (index == 6):
		DisplayServer.window_set_size(Vector2i(848, 480))
		resolution = Vector2i(848, 480)
	elif (index == 7):
		DisplayServer.window_set_size(Vector2i(640, 360))
		resolution = Vector2i(640, 360)
	config.set_value("Settings", "resolution", resolution)
	config.set_value("Settings", "resolution_index", index)


func _volume_changed(value):
	_click(volume_slider)
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	config.set_value("Settings", "volume", volume_slider.value)


func _on_play_pressed():
	_click(play)
	play.visible = false
	settings.visible = false
	exit.visible = false
	new_game.visible = true
	load_game.visible = true
	back.visible = true


func _on_back_pressed():
	_click(back)
	play.visible = true
	settings.visible = true
	exit.visible = true
	new_game.visible = false
	load_game.visible = false
	back.visible = false


func _on_new_game_mouse_entered():
	_hover(new_game)


func _on_new_game_mouse_exited():
	_unhover(new_game)


func _on_load_game_mouse_entered():
	_hover(load_game)


func _on_load_game_mouse_exited():
	_unhover(load_game)


func _on_back_mouse_entered():
	_hover(back)


func _on_back_mouse_exited():
	_unhover(back)
