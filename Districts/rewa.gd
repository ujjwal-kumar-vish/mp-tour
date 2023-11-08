extends Control

#new code start

export (String, FILE, "*.json") var d_file

var dialog =[
	{"name": "Brother", "expression": "neutral", "text": "Hy! We reached Rewa in Mukundpur, finally.", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "Yah, but why are you so exited? its only 18 KM from Rewa. And it only took one hour to reach here.", "BG": "1"},
	{"name": "Mother", "expression": "neutral", "text": "Now now, you two better behave, you do remember why we are here?", "BG": "1"},
	{"name": "Brother", "expression": "neutral", "text": "The Safari!", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "The zoo...", "BG": "1"},
	{"name": "Father", "expression": "neutral", "text": "WE ARE HERE FOR THE LAND OF WHITE TIGER !!!!!", "BG": "1"},
	{"name": "Sister", "expression": "neutral", "text": "When was Mukundpur tiger Safari established?", "BG": "2"},
	{"name": "Father", "expression": "neutral", "text": "The zoo was established in june 2015 and opened for the public in april 2016.", "BG": "2"},
	{"name": "Sister", "expression": "neutral", "text": "Look thats a Tiger!", "BG": "2"},
	{"name": "Mother", "expression": "neutral", "text": "The  most amazing beauty of the white tiger", "BG": "3"},
	{"name": "Sister", "expression": "neutral", "text": "What is the name of the white tiger in mukundpur?", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": "The tiger that was sighted by Maharaja Martand Singh was named Mohan.", "BG": "3"},
	{"name": "Sister", "expression": "neutral", "text": "Hy mother, Why is white tiger famous?", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "The white tiger is a result of a rare genetic mutation.", "BG": "3"},
	{"name": "Father", "expression": "neutral", "text": " White tiger have always captivated humans due to its beauty and rarity in the wild.They are powerful,adaptable animals in their natural environment.", "BG": "3"},
	{"name": "Mother", "expression": "neutral", "text": "Use yout binoculars, for a better view...", "BG": "4"},
	{"name": "Sister", "expression": "neutral", "text": "That is amazing!", "BG": "4"},
	{"name": "Brother", "expression": "neutral", "text": "Hy father,can you tell me the history of White Tiger Safari?", "BG": "6"},
	{"name": "Father", "expression": "neutral", "text": " The white tiger was caught by Maharaja Martand Singh on May 27, 1951 from Sidhi district’s Bargadi for-est area and later the animal was brought to Govindarh Palace in Rewa from where it escaped the very next day and then again found in Mukundpur area about 26-27 km away from Rewa.", "BG": "4"},
	{"name": "Brother", "expression": "neutral", "text": "Hmmmm...", "BG": "4"},
	#{"name": "Mother", "expression": "neutral", "text": "Smile!", "BG": "4"},
	#{"name": "Sister", "expression": "neutral", "text": "Smile!", "BG": "4"},
	#{"name": "Father", "expression": "neutral", "text": "Smile!", "BG": "4"},
	]

var dialog_index = 0
var finished = false
var current_screen = null
var current_chactor = null
var current_dialog_id = 0

func _ready():
	#start()
	
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


func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		if dialog[dialog_index]['BG']=='1':
			$Mukundpurentrince.show()
			
		elif dialog[dialog_index]['BG']=='2':
			$MukundpurSafari.show()
			
		elif dialog[dialog_index]['BG']=='3':
			$MukundpurWhitetiger.show()
			
		elif dialog[dialog_index]['BG']=='4':
			$MukundpurTiger.show()
			
		if dialog[dialog_index]['name']=='Father':
			$Man.show()
			$Girl2.hide()
			$Girl3.hide()
			$ModiJi.hide()
			
		elif dialog[dialog_index]['name']=='Sister':
			$Man.hide()
			$Girl2.hide()
			$Girl3.show()
			$ModiJi.hide()
			
		elif dialog[dialog_index]['name']=='Mother':
			$Man.hide()
			$Girl2.show()
			$Girl3.hide()
			$ModiJi.hide()
			
		elif dialog[dialog_index]['name']=='Brother':
			$Man.hide()
			$Girl2.hide()
			$Girl3.hide()
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
		get_tree().change_scene("res://dialogues/Quiz/rewa_quiz.tscn")
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
