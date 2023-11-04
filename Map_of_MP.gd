extends Control



func _ready():
	pass # Replace with function body.

func _process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

func _on_Rewa_pressed():
	get_tree().change_scene("res://Districts/Rewa.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Satna_pressed():
	get_tree().change_scene("res://Districts/Maihar.tscn")


func _on_Ujjain_pressed():
	get_tree().change_scene("res://Districts/Ujjain.tscn")


func _on_Jabalpur_pressed():
	get_tree().change_scene("res://Districts/Jabalpur.tscn")
