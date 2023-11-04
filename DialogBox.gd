extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "what is this place Father...?", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "This is a <insert place name here>.", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "what is this famouse for?", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "it is famous for <insert text here>", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "Ooooooo..... is this the same place that i read about in my text book.", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": "Yes....", "BG": "3"},
	]

var dialog_index = 0
var finished = false
var current_screen = null
var current_chactor = null
var current_dialog_id = 0
var BG = [$RewaStation2, $RewaFort3, $RewaFort2, $RewaFort1]

func _ready():

	load_dialog()

func _process(delta):
	$NextIcon.visible = finished
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()


func hide_char():
	$Girl2.hide()
	$Girl3.hide()
	$Man.hide()
	$ModiJi.hide()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		if dialog[dialog_index]['BG']=='1':
			$RewaStation2.show()
			
		elif dialog[dialog_index]['BG']=='2':
			$RewaFort3.show()
			
		elif dialog[dialog_index]['BG']=='3':
			$RewaFort2.show()
			
		if dialog[dialog_index]['name']=='Father':
			hide_char()
			$Man.show()
			
			
		elif dialog[dialog_index]['name']=='Sister':
			hide_char()
			$Girl3.show()
			
		elif dialog[dialog_index]['name']=='Mother':
			hide_char()
			$Girl2.show()
			
		elif dialog[dialog_index]['name']=='Brother':
			hide_char()
			$ModiJi.show()
			
			
		$Body.text = dialog[dialog_index]['text']
		$Name.text = dialog[dialog_index]['name']
		#$Body.bbcode_text = dialog[dialog_index]
		$Body.percent_visible = 0
		$Tween.interpolate_property(
			$Body, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else :
		queue_free()
		get_tree().change_scene("res://MainMenu.tscn")
	dialog_index += 1



func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	


func _on_Tween_tween_completed(object, key):
	finished = true
	$NextIcon/AnimationPlayer.play("IDLE")

func show_and_hide(first, second):
	first.show()
	second.hide()


func _on_Next_pressed():
	$click_enter.play()
	load_dialog()


func _on_Back_pressed():
	$click_enter.play()
	dialog_index -= 2
	if dialog_index <= 0:
		dialog_index=0
	load_dialog()
