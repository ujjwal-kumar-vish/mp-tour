extends Control

onready var Menu = $Menu
onready var Settings = $Settings
onready var Video = $Video
onready var Audio = $Audio
onready var Tutorial = $Tutorial
onready var Profile = $Profile
onready var Language = $Language
onready var Score_Board = $Score_Board


func _process(delta):
#	'''if Input.is_action_just_pressed("ui_cancel"):
#		toggle()'''
	
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()


func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_Start_Tour_pressed():
	"""toggle()
	$click_enter.play()
	if $AudioStreamPlayer.playing == true:
		$AudioStreamPlayer.stop()"""
	get_tree().change_scene("res://Map_of_MP.tscn")
	
	
func _on_Settings_pressed():
	$click_enter.play()
	show_and_hide(Settings, Menu)
	
func show_and_hide(first, second):
	first.show()
	second.hide()
	
	

func _ready():
	pass # Replace with function body.


func _on_Quit_pressed():
	
	$click_enter.play()
	get_tree().quit()

func _on_Score_Board_pressed():
	$click_enter.play()
	show_and_hide(Score_Board, Menu)
	

func _on_Profile_pressed():
	$click_enter.play()
	show_and_hide(Profile, Settings)
	


func _on_Audio_pressed():
	$click_enter.play()
	show_and_hide(Audio, Settings) # Replace with function body.


func _on_Video_pressed():
	$click_enter.play()
	show_and_hide(Video, Settings) # Replace with function body.


func _on_Tutorial_pressed():
	$click_enter.play()
	show_and_hide(Tutorial, Settings) # Replace with function body.


func _on_Language_pressed():
	$click_enter.play()
	show_and_hide(Language, Settings) # Replace with function body.


func _on_BackSettings_pressed():
	$click_back.play()
	show_and_hide(Menu, Settings) # Replace with function body.


func _on_BackToMenu_pressed():
	$click_back.play()
	show_and_hide(Menu, Score_Board)# Replace with function body.


func _on_BackToSettings_pressed():
	$click_back.play()
	show_and_hide(Settings, Language) # Replace with function body.


func _on_BackToSettings1_pressed():
	$click_back.play()
	show_and_hide(Settings, Profile) # Replace with function body.


func _on_BackToSettings2_pressed():
	$click_back.play()
	show_and_hide(Settings, Tutorial)# Replace with function body.


func _on_BackToSettings3_pressed():
	$click_back.play()
	show_and_hide(Settings, Audio) # Replace with function body.


func _on_BackToSettings4_pressed():
	$click_back.play()
	show_and_hide(Settings, Video) # Replace with function body.


func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed

func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed


func _on_Master_value_changed(value):
	Volume(0, value)


func Volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_Music_value_changed(value):
	Volume(1, value)


func _on_Sound_FX_value_changed(value):
	Volume(2, value)
