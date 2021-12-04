extends Spatial

const cam_dist = 12
const friction = 0.9
const speed = 0.25

var cam_angle = 0
#var vel = 0
var pressed = false
var in_menu = true

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cam_angle += delta * speed
	#cam_angle += vel
	#vel = vel * frictionf
	$Camera.rotation.y = cam_angle
	$Camera.transform.origin.x = sin(cam_angle) * cam_dist
	$Camera.transform.origin.z = cos(cam_angle) * cam_dist
	
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED and not in_menu:
		show_menu()

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		pressed = event.pressed
#	if event is InputEventMouseMotion and pressed:
#		vel += event.relative.x * speed

func show_gui(gui):
	$GUI.add_child(gui)
	$GUI.show()
	$Menu.hide()
	$Overlay.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	in_menu = true
	
func show_menu():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Menu.show()
	$Menu/PanelContainer/VBoxContainer/Button.grab_focus()
	$Overlay.hide()
	$GUI.hide()
	$Camera.current = true
	in_menu = true
	for child in $GUI.get_children():
		child.queue_free()

func hide_menu():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Menu.hide()
	$Overlay.show()
	$Player/Camera.current = true
	in_menu = false
	for child in $GUI.get_children():
		child.queue_free()

func toggle_menu():
	if not in_menu:
		show_menu()
	else:
		hide_menu()
