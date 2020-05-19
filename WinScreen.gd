extends Node2D

var win_label
var button
var panel

func _ready():
	panel = get_child(0)
	panel.visible = false
	win_label = get_child(1)
	win_label.visible = false
	button = get_child(2)
	button.visible = false

func show_win_screen():
	win_label.visible = true
	button.visible = true
	panel.visible = true

func _on_KeyArea_input_event(camera, event, click_position, click_normal, shape_idx):
	if (event.is_action("select")):
		show_win_screen()
	pass

func _on_Button_button_down():
	get_tree().change_scene("res://Game.tscn")
