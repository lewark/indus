extends Spatial

const cam_dist = 12
const friction = 0.9
const speed = 0.5

var cam_angle = 0
#var vel = 0
var pressed = false

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
	
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED and not $Menu.visible:
		$Menu.show()
		$PanelContainer.hide()
		$Camera.current = true

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		pressed = event.pressed
#	if event is InputEventMouseMotion and pressed:
#		vel += event.relative.x * speed

func loadGui(scene):
	$Gui/MarginContainer.add_child(scene.instance())
	for child in $Markers.get_children():
		child.hide_marker()
	$Gui.show()
	
func exitGui():
	for child in $Gui/MarginContainer.get_children():
		child.queue_free()
	for child in $Markers.get_children():
		child.show_marker()
	$Gui.hide()

func toggle_menu():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$Menu.show()
		$PanelContainer.hide()
		$Camera.current = true
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$Menu.hide()
		$PanelContainer.show()
		$Player/Camera.current = true
