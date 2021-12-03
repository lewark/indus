extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var offset = 0

var hidden = false

export (String, MULTILINE) var text = "Hello"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = $"../../Player/Camera".unproject_position(transform.origin)
	$Label.update()
	$Label.margin_left = pos.x
	$Label.margin_top = pos.y #$Marker2D.margin_bottom
	
	#print($Label.rect_size.x)
