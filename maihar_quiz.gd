extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Quiz time!!!", "BG": "1", "ans": "1", "option1": "none", "option2": "none", "option3": "none", "option4": "none"},
	{"name": "Mother", "expression": "neutral", "text": "What is this place famous for?", "BG": "1", "ans": "1", "option1": "Sakti Peeth", "option2": "Hill", "option3": "Culture", "option4": "Food"},
	{"name": "Father", "expression": "neutral", "text": "How far is it from the main city?", "BG": "1", "ans": "1", "option1": "35km", "option2": "25km", "option3": "45km", "option4": "100km"},
	{"name": "Sister", "expression": "neutral", "text": "What is the meaning of 'Maihar'?", "BG": "2", "ans": "1", "option1": "Necklace of Mother", "option2": "Crown of Mother", "option3": "Throne of Father", "option4": "none"},
	{"name": "Mother", "expression": "neutral", "text": "Thanks for visiting", "BG": "2", "ans": "1", "option1": "none", "option2": "none", "option3": "none", "option4": "none"},
	]

var score = 0
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
	
func hide_button():
	$TextureRect/Button1.hide()
	$TextureRect/Button2.hide()
	$TextureRect/Button3.hide()
	$TextureRect/Button4.hide()
	
func show_button():
	$TextureRect/Button1.show()
	$TextureRect/Button2.show()
	$TextureRect/Button3.show()
	$TextureRect/Button4.show()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		
		if dialog[dialog_index]["text"]=="Quiz time!!!" or dialog[dialog_index]["text"]=="Thanks for visiting":
			hide_button()
			$Next.show()
			$right.hide()
			$wrong.hide()
		else:
			$Next.hide()
			show_button()
			$TextureRect/Button1.text = dialog[dialog_index]['option1']
			$TextureRect/Button2.text = dialog[dialog_index]['option2']
			$TextureRect/Button3.text = dialog[dialog_index]['option3']
			$TextureRect/Button4.text = dialog[dialog_index]['option4']
		
		if dialog[dialog_index]['BG']=='1':
			$RewaStation2.show()
			
			
		
			
		"""elif dialog[dialog_index]['BG']=='2':
			$RewaFort3.show()
			
		elif dialog[dialog_index]['BG']=='3':
			$RewaFort2.show()"""
			
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
	$right.hide()
	load_dialog()


func _on_Back_pressed():
	$click_enter.play()
	dialog_index -= 2
	if dialog_index <= 0:
		dialog_index=0
	load_dialog()


func _on_Button1_pressed():
	if dialog[dialog_index-1]['ans'] == '1':
		$right.show()
		$wrong.hide()
		$Next.show()
		score+=1
	else:
		$right.hide()
		$wrong.show()
		


func _on_Button2_pressed():
	if dialog[dialog_index-1]['ans'] == '2':
		$right.show()
		$wrong.hide()
		$Next.show()
		score+=1
	else:
		$right.hide()
		$wrong.show()

func _on_Button3_pressed():
	if dialog[dialog_index-1]['ans'] == '3':
		$right.show()
		$wrong.hide()
		$Next.show()
		score+=1
	else:
		$right.hide()
		$wrong.show()

func _on_Button4_pressed():
	if dialog[dialog_index-1]['ans'] == '4':
		$right.show()
		$wrong.hide()
		$Next.show()
		
	else:
		$right.hide()
		$wrong.show()
