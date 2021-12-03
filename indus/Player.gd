extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const GRAVITY = 9.8
const SENSITIVITY = 0.01

const SPEED = 3

var velocity = Vector3(0,0,0)

func _physics_process(delta):
	var forward = -Vector3($Camera.transform.basis.z.x, 0, $Camera.transform.basis.z.z)
	
	var right = Vector3($Camera.transform.basis.x.x, 0, $Camera.transform.basis.x.z)
	
	var dir = Vector3(0,0,0)
	
	if Input.is_action_pressed("ui_up"):
		dir += forward
	if Input.is_action_pressed("ui_down"):
		dir -= forward
	if Input.is_action_pressed("ui_right"):
		dir += right
	if Input.is_action_pressed("ui_left"):
		dir -= right
	
	dir = dir.normalized()
	
	velocity.x = dir.x * SPEED
	velocity.z = dir.z * SPEED
	velocity.y -= GRAVITY * delta
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = 5
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if transform.origin.y < -10:
		transform.origin = Vector3(0,1,0)
		velocity = Vector3(0,0,0)
	

func _input(event):
	if event is InputEventMouseMotion:
		$Camera.rotation.x = clamp($Camera.rotation.x - event.relative.y * SENSITIVITY, -PI/2*0.99, PI/2*0.99)
		$Camera.rotation.y = fmod($Camera.rotation.y - event.relative.x * SENSITIVITY,PI * 2)
