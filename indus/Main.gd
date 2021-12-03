extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var cam_angle = 0
const cam_dist = 10
const friction = 0.9
const speed = 0.001

var vel = 0

var pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#cam_angle += delta
	cam_angle += vel
	vel = vel * friction
	$Camera.rotation.y = cam_angle
	$Camera.transform.origin.x = sin(cam_angle) * cam_dist
	$Camera.transform.origin.z = cos(cam_angle) * cam_dist

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		pressed = event.pressed
	if event is InputEventMouseMotion and pressed:
		vel += event.relative.x * speed

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
