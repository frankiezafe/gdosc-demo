extends OSCreceiver

func _process(delta):
	# if "Emit signal", do not retrieve messages here, or nothing will be sent to listeners
	return
	while( has_waiting_messages() ):
		var msg = get_next_message()
		var s = msg.address()  + " | " + str(msg.arg_num()) + " | "
		for i in msg.arg_num():
			s += str( msg.arg(i)) + " | "
		print( s )
		continue
		

func _ready():
	# if "Emit signal" is enable, messages can be sent automatically to listeners
	connect( "osc_message_received", get_parent().get_node( "debugger"), "dump_osc" )
	connect( "osc_message_received", get_parent().get_node( "objs/polymorph-logo"), "parse_osc" )
	set_process(true)
	pass