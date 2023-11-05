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
	#start()
	$RewaStation2.show()
	load_dialog()

func start():
	#dialog = load_dialog()
	current_dialog_id = -1
	#next_script()
"""
func next_script():
	current_dialog_id += 1
	if current_dialog_id >= len(dialog):
		$Name.text = dialog[current_dialog_id]['name']
		$Body.text = dialog[current_dialog_id]['text']
"""
func _process(delta):
	$NextIcon.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
		"""
func load_dialog():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, file.READ)
		return parse_json(file.get_as_text())
"""

func hide_char():
	$Girl2.hide()
	$Girl3.hide()
	$Man.hide()
	$ModiJi.hide()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		if dialog[dialog_index]['BG']=='1':
			current_screen = $RewaStation2
			
		elif dialog[dialog_index]['BG']=='2':
			show_and_hide($RewaFort3, current_screen)
			$RewaFort3.show()
			current_screen = $RewaFort3
			
		elif dialog[dialog_index]['BG']=='3':
			show_and_hide($RewaFort2, current_screen)
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


func _on_RewaStation2_visibility_changed():
	pass


func _on_Next_pressed():

	load_dialog()


func _on_Back_pressed():
	dialog_index -= 2
	if dialog_index <= 0:
		dialog_index=0
	load_dialog()
