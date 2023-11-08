extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached Indore in Dr. Babasaheb Ambedkar, Birth place, finally.", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 665.1 KM from satna. And it only took thirteen hour fifty-two minutes to reach here.", "BG": "5"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "5"},
	{"name": "Brother", "expression": "neutral", "text": "Yes mother!", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yes mother...", "BG": "5"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE LAND OF DR.BABASAHAB AMBEDKAR, BIRTH PLACE !!!!!", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "Where is Babasaheb Ambedkar's birthplace located in Madhya Pradesh, India?!", "BG": "6"},
	{"name": "Mother", "expression": "neutral", "text": "Babasaheb Ambedkar Birth place , located at Mhow in Madhya Pradesh, India.", "BG": "6"},
	{"name": "Sister", "expression": "neutral", "text": "When was Babasaheb Ambedkar born?", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": "This Babasaheb Ambedkar was born on 14 April 1891.", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "Hy mother, Which is the nearest airport to reach Dr Babasaheb Ambedkar birth place?", "BG": "6"},
	{"name": "Mother", "expression": "neutral", "text": "The nearest airport to reach Dr Babasaheb Ambedkar Birth Place is Indore Airport.", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": " The distance between Dr Babasaheb Ambedkar Birth Place and Indore is 38 km which can be easily covered by hiring a taxi from Indore.  You can also take your car and take a short road trip enjoying the natural beauty along the way.", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "Hy father,can you tell me the history of Dr. Babasaheb Ambedkar, Birth place?", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": " Babasaheb Ambedkar Birth Place is located in Mhow in Madhya Pradesh, India.  It was the birthplace of Babasaheb Ambedkar, who was born in Mhow on 14 April 1891.  Where the local government built this grand monument.  The memorial was inaugurated by Sunder Lal Patwa, the then Chief Minister of Madhya Pradesh, on Ambedkar's 100th birth anniversary – 14 April 1991.", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "On which birthday was Babasaheb Ambedkar's memorial inaugurated?", "BG": "3"},
	{"name": "father", "expression": "neutral", "text": "On the 117th birthday of Babasaheb Ambedkar, the memorial was inaugurated.", "BG": "3"},
	{"name": "Brother", "expression": "neutral", "text": "Look mother and sister has also arrived", "BG": "3"},
	{"name": "father", "expression": "neutral", "text": "oh there you are, what are we waiting for lets go inside", "BG": "3"},
	{"name": "Brother", "expression": "neutral", "text": "Smile!", "BG": "4"},
	{"name": "Mother", "expression": "neutral", "text": "Smile!", "BG": "4"},
	{"name": "Sister", "expression": "neutral", "text": "Smile!", "BG": "4"},
	{"name": "Father", "expression": "neutral", "text": "Smile!", "BG": "4"},
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
		if dialog[dialog_index]['BG']=='1':
			$Shutterstock.show()
			$Dhuandhar1.hide()
			$Bhedaghat2.hide()
			$Bhedaghat0.hide()
			$"1689854332979".hide()
			
		elif dialog[dialog_index]['BG']=='2':
			$Shutterstock.hide()
			$Dhuandhar1.show()
			$Bhedaghat2.hide()
			$Bhedaghat0.hide()
			$"1689854332979".hide()
			
		elif dialog[dialog_index]['BG']=='3':
			$Shutterstock.hide()
			$Dhuandhar1.hide()
			$Bhedaghat2.show()
			$Bhedaghat0.hide()
			$"1689854332979".hide()
			
		elif dialog[dialog_index]['BG']=='4':
			$Shutterstock.hide()
			$Dhuandhar1.hide()
			$Bhedaghat2.hide()
			$Bhedaghat0.show()
			$"1689854332979".hide()
			
		elif dialog[dialog_index]['BG']=='5':
			$Shutterstock.hide()
			$Dhuandhar1.hide()
			$Bhedaghat2.hide()
			$Bhedaghat0.hide()
			$"1689854332979".show()
			
			
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
		get_tree().change_scene("res://dialogues/Quiz/Jabalpur_quiz.tscn")
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
