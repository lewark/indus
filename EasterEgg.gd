extends Area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var duck = preload("res://Duck.tscn")

var duck_spawned = false

func interact():
	if $"../../Water".visible:
		if not duck_spawned:
			var duck_inst = duck.instance()
			$"../..".add_child(duck_inst)
			duck_inst.transform.origin = $"../../Position3D".transform.origin
			duck_spawned = true
	else:
		$"../../Water".show()
	
func get_hover_text():
	if $"../../Water".visible:
		if duck_spawned:
			return null
		return "Click for ???"
	return "Click for water"
	
