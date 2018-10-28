extends OSCsender

var parent = null

func _process(delta):
	if (parent == null):
		return
	#msg_address("/emitter/rot" )
	#msg_add_quat( Quat(parent.global_transform.basis) )
	#msg_send()
	
	msg_address("/emitter/pos" )
	msg_add_v3( parent.global_transform.origin )
	msg_send()

func _ready():
	set_process(true)
	pass
