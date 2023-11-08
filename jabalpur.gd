extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached  Jabalpur in Bhedaghat, finally.", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 18 KM from Jabalpur. And it only took thirty minutes to reach here.", "BG": "5"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "5"},
	{"name": "Brother", "expression": "neutral", "text": "Yes mother!", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yes mother...", "BG": "5"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE DHUANDHAR WATERFALL !!!!!", "BG": "1"},
		{"name": "Sister", "expression": "neutral", "text": "When was Smoky Falls included as a World Heritage by UNESCO?", "BG": "1"},
		{"name": "Father", "expression": "neutral", "text": "Smoky Falls was inscribed as a World Heritage Site by UNESCO on 20 May 2021.", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "What a beautiful sight to behold!", "BG": "2"},
	{"name": "Sister", "expression": "neutral", "text": "Dhuandhar Falls is formed by the fall of water of which river?", "BG": "3"},
		{"name": "Father", "expression": "neutral", "text": "Dhuandhar Falls is formed by the fall of water of Narmada river.", "BG": "3"},
	{"name": "Sister", "expression": "neutral", "text": "Hy mother,When is a huge fair organized in Bhedaghat?", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "A huge fair is organized every year in the month of kartik in Bhedaghat.", "BG": "4"},
	{"name": "Father", "expression": "neutral", "text": "This place looks more beautiful when the sun rays fall on these white marble rocks and shadows fall on the water.  Then it is a pleasant experience to see these white rocks with black and dark volcanic seas, and for those who like nature, there is also the facility of boat riding.", "BG": "4"},
	{"name": "Brother", "expression": "neutral", "text": "Hy father,can you tell me the history of Bhedaghat waterfall?", "BG": "4"},
	{"name": "Father", "expression": "neutral", "text": " Bhedaghat Waterfall is a center of attraction not only for Madhya Pradesh but for the whole of India.  It is considered to be the most beautiful and important place among the tourist places of Madhya Pradesh.  To see this, people come here not only from India but from different regions of the world.  This tourist destination has also been included as a ‘World Heritage’ by UNESCO on 20 May 2021.", "BG": "5"},
	{"name": "Brother", "expression": "neutral", "text": "Which movie has been shot in Bhedaghat?", "BG": "5"},
	{"name": "father", "expression": "neutral", "text": "Many films have also been shot here.  In 1974, Sunil Dutt's film 'Pran Jaye Par Vachan Na Jaye' was shot here in Bhedaghat.  The famous song, 'Raat Ka Nasha Abhi' from Shahrukh Khan's film 'Ashoka' has also been shot in Bhedaghat.  Apart from this, a film 'Mohenjo Daro' released in 2016 was also shot in Bhedaghat.", "BG": "3"},
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
