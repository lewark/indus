extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var cam_angle = 0
const cam_dist = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cam_angle += delta
	$Camera.rotation.y = cam_angle
	$Camera.transform.origin.x = sin(cam_angle) * cam_dist
	$Camera.transform.origin.z = cos(cam_angle) * cam_dist
