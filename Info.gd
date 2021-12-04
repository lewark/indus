extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scene = preload("res://gui/InfoBox.tscn")

export (String) var title = ""
export (String, MULTILINE) var description = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BezierCircle.rotation.z += delta

func interact():
	var s = scene.instance()
	s.set_info(title,description)
	$"../..".show_gui(s)
	
func get_hover_text():
	return "Click to read"
