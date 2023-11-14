extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached Chitrakoot, finally.", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 77.3 KM from satna. And it only took one and a half hour to reach here.", "BG": "5"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "5"},
	{"name": "Brother", "expression": "neutral", "text": "Yes mother!", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yes mother...", "BG": "5"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE RAM DARSHANA TEMPLE !!!!!", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "YEYA!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Aham!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Why is Chitrakoot called Chitrakoot?", "BG": "1"},
	{"name": "Mother", "expression": "neutral", "text": "The name Chitrakoot literally translates into a hill of many wonders, and the Chitrakoot Parvat Mala (garland of mountains)", "BG": "1"},

	{"name": "Sister", "expression": "neutral", "text": "Why chitrakoot famous?", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "Chitrakoot mountain range includes Kamad Giri,Hanuman Dhara, Seeta rasoi,Janki Kund,Lakshman pahari,and Devangana which are famous religious mountains.", "BG": "3"},
		{"name": "Brother", "expression": "neutral", "text": "What is the old name of Chitrakoot?", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "Old name is Chhatrapati Shahuji Maharaj-Nager.It was later on 4th Sept 1998 came to be known as Chitrakoot.", "BG": "2"},

	{"name": "Sister", "expression": "neutral", "text": "What is the story behind chitrakoot?", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "The forests of Chitrakoot is where Rama,Sita and Lakshmana took refuge and spent 14 years in the woods,which was already home to several hermits.", "BG": "1"},


	{"name": "Brother", "expression": "neutral", "text": "Which river flows in Chitrakoot?", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "Chitrakoot Dham is situated on the bank of the Mandakini(Payaswini) river,with mountainous terrian.", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "oh there you are, what are we waiting for lets go inside", "BG": "3"},
	{"name": "Brother", "expression": "neutral", "text": "Jai Shree Ram!", "BG": "4"},
	{"name": "Mother", "expression": "neutral", "text": "Jai Shree Ram!", "BG": "4"},
	{"name": "Sister", "expression": "neutral", "text": "Jai Shree Ram!", "BG": "4"},
	{"name": "Father", "expression": "neutral", "text": "Jai Shree Ram!", "BG": "4"},
	]

var dialog_index = 0
var finished = false
var current_screen = null
var current_chactor = null
var current_dialog_id = 0


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
	
func hide_bg():
	$a.hide()
	$b.hide()
	$c.hide()
	$d.hide()
	$e.hide()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		hide_bg()
		if dialog[dialog_index]['BG']=='1':
			$a.show()
			
		elif dialog[dialog_index]['BG']=='2':
			$b.show()
			
		elif dialog[dialog_index]['BG']=='3':
			$c.show()
			
		elif dialog[dialog_index]['BG']=='4':
			$d.show()
			
		elif dialog[dialog_index]['BG']=='5':
			$e.show()
			
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
