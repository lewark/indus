extends Area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var duck = preload("res://Duck.tscn")
var duck_inst = null

func interact():
	if $"../../Water".visible:
		if not duck_inst:
			duck_inst = duck.instance()
			$"../..".add_child(duck_inst)
			duck_inst.transform.origin = $"../../Position3D".transform.origin
		duck_inst.get_node("AudioStreamPlayer3D").play()
	else:
		$"../../Water".show()
	
func get_hover_text():
	if $"../../Water".visible:
		return "Click for ???"
	return "Click for water"
	
