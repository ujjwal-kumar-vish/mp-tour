extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached Maihar, finally.", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 35 KM from satna. And it only took half an hour to reach here.", "BG": "5"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "5"},
	{"name": "Brother", "expression": "neutral", "text": "Yes mother!", "BG": "5"},
	{"name": "Sister", "expression": "neutral", "text": "Yes mother...", "BG": "5"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE DARSHANA OF SHARDA MATA!!!!!", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "YEYA!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Aham!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "So... are we taking the stairs or what?", "BG": "1"},
	{"name": "Mother", "expression": "neutral", "text": "RoapWay", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "RoapWay!", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "Stairs!!!", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "Ok... the team has been desided... LET'S GO!!!!", "BG": "1"},
	{"name": "Narrator", "expression": "neutral", "text": "Father and Brother took the Staris", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "soooo... Father how long are these stairs?", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "About 1000!", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "oh no.....", "BG": "2"},
	{"name": "Narrator", "expression": "neutral", "text": "Mother and sister took the roap way", "BG": "6"},
	{"name": "Sister", "expression": "neutral", "text": "What a beautiful sight to behold!", "BG": "6"},
	{"name": "Mother", "expression": "neutral", "text": "the lavis green of the mountain is grate", "BG": "6"},
	{"name": "Mother", "expression": "neutral", "text": "I don't know why they took the stairs...", "BG": "6"},
	{"name": "Sister", "expression": "neutral", "text": "Hy mother, Why is this temple so sacrad?", "BG": "6"},
	{"name": "Mother", "expression": "neutral", "text": "Do you know how Maihar fot its name?", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": " The name means 'Necklace of Mother'. It is believed that when Lord Shiva was carrying Sati, her necklace fell down here.", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "Also people believed that the spirit of the legendary warrior Alha visits everyday to offer prayers at the temple.", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": " While the temple attracts thousands of devotees year on year, the town is also considered as one of the 51 Shakti Peeths of Goddess Parvati.", "BG": "6"},
	{"name": "Sister", "expression": "neutral", "text": "What is Shakti Peeths ?", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": "The Shakti Peethas are holy places of worship dedicated to Sati or Shakti. According to scriptures, there are 51 Peethas and these are believed to be places where the body parts of Sati fell. Hence the Shakti Peethas came into existence.", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "Oh look We reached the top of the hill.", "BG": "2"},
	{"name": "Brother", "expression": "neutral", "text": "yay!", "BG": "3"},
	{"name": "Brother", "expression": "neutral", "text": "Wait what is this hill called exactly.", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": "This is Trikoota hill.", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": "Look mother and sister has also arrived", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "oh there you are, what are we waiting for lets go inside", "BG": "3"},
	{"name": "Brother", "expression": "neutral", "text": "Jai Mata Di!", "BG": "4"},
	{"name": "Mother", "expression": "neutral", "text": "Jai Mata Di!", "BG": "4"},
	{"name": "Sister", "expression": "neutral", "text": "Jai Mata Di!", "BG": "4"},
	{"name": "Father", "expression": "neutral", "text": "Jai Mata Di!", "BG": "4"},
	]

var dialog_index = 0
var finished = false
var current_screen = null
var current_chactor = null
var current_dialog_id = 0
var BG = [$RewaStation2, $RewaFort3, $RewaFort2, $RewaFort1]

func _ready():
	#start()
	load_dialog()

func start():
	#dialog = load_dialog()
	current_dialog_id = -1
	#next_script()

func _process(delta):
	$NextIcon.visible = finished
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func hide_BG():
	$MaiharEntrance.hide()
	$MaiharMata.hide()
	$MaiharStairs.hide()
	$MaiharStation.hide()
	$MaiharTemple1.hide()
	$MaiharRoapway1.hide()

func hide_char():
	$Girl2.hide()
	$Girl3.hide()
	$Man.hide()
	$ModiJi.hide()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		if dialog[dialog_index]['BG']=='1':
			hide_BG()
			$MaiharEntrance.show()
			
		elif dialog[dialog_index]['BG']=='2':
			hide_BG()
			$MaiharStairs.show()
			
		elif dialog[dialog_index]['BG']=='3':
			hide_BG()
			$MaiharTemple1.show()
		
		elif dialog[dialog_index]['BG']=='4':
			hide_BG()
			$MaiharMata.show()
		
		elif dialog[dialog_index]['BG']=='5':
			hide_BG()
			$MaiharStation.show()
			
		elif dialog[dialog_index]['BG']=='6':
			hide_BG()
			$MaiharRoapway1.show()
			
			
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
		
		elif dialog[dialog_index]['name']=='Narrator':
			hide_char()
			
			
			
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
		get_tree().change_scene("res://dialogues/Quiz/maihar_quiz.tscn")
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
	$click_enter.play()
	load_dialog()


func _on_Back_pressed():
	$click_enter.play()
	dialog_index -= 2
	if dialog_index <= 0:
		dialog_index=0
	load_dialog()
