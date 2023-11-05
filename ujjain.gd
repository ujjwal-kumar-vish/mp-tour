extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached Mahakaleshwar temple Ujjain, finally.", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 2.7 KM from ujjain. And it only took 11 minut to reach here.", "BG": "1"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "Yes mother!", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "Yes mother...", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE DARSHANA OF MAHAKALESHWAR JYOTIRLINGA!!!!!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Do you know how Mahakaleshwar temple for its name? ", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Mahakaleshwar, refers to Lord Shiva, the one among the trinity of Hinduism, i.e., Brahma, Vishnu and Maheshwara, wherein Lord Shiva is also known as Maheshwara. This is the temple ", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "How many years old is Mahakaleshwar temple?", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "The temple was built in the 6th century AD by Kumarasena,the son of a former king of ujjain, Chandpradyot.", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "How many to top places to visit in ujjain?", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "Mahakaleshwar Mandir, kal Bhairav Mandir, kumbh Mela and Ram Ghat.", "BG": "2"},
	{"name": "Sister", "expression": "neutral", "text": "Which are the 3 jyotirlinga near Ujjain?", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "Omkareshwar Jyotirlinga temple, Mahakaleshwar Jyotirlinga temple, Kaal Bhairab temple, Ram Mandir ghat and Har Siddhi Temple. All these places are known to attract tourists from around the country and world.", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "What are the benifits of visiting the temple?", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "Spiritual Significance: The Mahakaleshwar Temple is dedicated to Lord Shiva, one of the principal deities in Hinduism, Cultural and Architectural Heritage, Rituals and Worship", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "Oh there you are, what are we waiting for lets go inside", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "Jai Shree Mahakal!", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "Jai Shree Mahakal!", "BG": "3"},
	{"name": "Sister", "expression": "neutral", "text": "Jai Shree Mahakal!", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": "Jai Shree Mahakal!", "BG": "3"},
	]

var dialog_index = 0
var finished = false
var current_screen = null
var current_chactor = null
var current_dialog_id = 0
#var BG = [$RewaStation2, $RewaFort3, $RewaFort2, $RewaFort1]

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
		if dialog[dialog_index]['BG']=='2':
			$Ujjain0.show()
			$Ujjain1.hide()
			$Ujjain2.hide()
			
		elif dialog[dialog_index]['BG']=='3':
			$Ujjain1.show()
			$Ujjain0.hide()
			$Ujjain2.hide()
			
		elif dialog[dialog_index]['BG']=='1':
			$Ujjain2.show()
			$Ujjain0.hide()
			$Ujjain1.hide()
			
			
			
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
