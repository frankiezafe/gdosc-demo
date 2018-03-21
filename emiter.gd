extends Spatial

func _process(delta):
	rotate_y( delta )
	pass

func _ready():
	set_process(true)
	get_node("OSCsender").parent = self
	pass