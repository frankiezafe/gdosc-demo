extends Spatial

var received_pos
var refresh

func parse_osc( msg ):
	if ( msg.empty() ):
		return
	if ( !msg.address() == "/pm/pos" ):
		return
	received_pos = Vector3( msg.arg(0),msg.arg(1),msg.arg(2))
	set_translation(received_pos)
	pass

func _ready():
	received_pos = Vector3(0,0,0)
	pass
