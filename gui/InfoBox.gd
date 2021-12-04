extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_info(title, desc):
	$PanelContainer/VBoxContainer/Title.text = title
	$PanelContainer/VBoxContainer/HBoxContainer/ScrollContainer/Description.bbcode_text = desc


func _on_CloseButton_pressed():
	$"../..".toggle_menu()
