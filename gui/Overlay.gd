extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var text = $"../Player".get_hover_text()
	if text:
		$PanelContainer2.show()
		$PanelContainer2/Label.text = text
	else:
		$PanelContainer2.hide()
	
	var size = get_viewport().size
	var pos = size/2 - $TextureRect.rect_size/2
	$TextureRect.margin_left = pos.x
	$TextureRect.margin_top = pos.y
	
	$PanelContainer2.margin_top = pos.y + $TextureRect.rect_size.y + 10
	$PanelContainer2.margin_left = size.x / 2 - $PanelContainer2.rect_size.x / 2
	#print($Label.rect_size)
	#print($"../Player".can_interact())
	
	
