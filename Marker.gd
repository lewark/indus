extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var offset = 0

var img = preload("res://assets/textures/circle.png")
var img_hover = preload("res://assets/textures/circle_filled.png")

var hidden = false

export (String) var text = "Hello"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Marker2D/PanelContainer/Label.text = text
	$Marker2D/PanelContainer.visible = false
	offset = img.get_width() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = $"../../Camera".unproject_position(transform.origin)
	$Marker2D.margin_left = pos.x - offset
	$Marker2D.margin_top = pos.y - offset #$Marker2D.margin_bottom
	
func click():
	pass

func _on_Marker2D_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if not hidden:
				click()

func _on_Marker2D_mouse_entered():
	$Marker2D/TextureRect.texture = img_hover
	$Marker2D/PanelContainer.visible = true

func _on_Marker2D_mouse_exited():
	$Marker2D/TextureRect.texture = img
	$Marker2D/PanelContainer.visible = false

func hide_marker():
	hidden = true
	$Marker2D.hide()
	
func show_marker():
	hidden = false
	$Marker2D.show()
