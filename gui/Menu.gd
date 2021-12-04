extends CenterContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.has_feature("web"):
		$PanelContainer/VBoxContainer/Button2.hide()
	$PanelContainer/VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	$"..".toggle_menu()

func _on_Button2_pressed():
	get_tree().quit()
