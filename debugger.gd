extends TextEdit

var line_num
var line_max
var msg_received
var lines = []
var txt_content

func dump_osc( msg ):
	if ( msg.empty() ) :
		return
	while( lines.size() >= line_max ):
		lines.remove(0)
	var l = str(msg_received) +  " > "
	l += msg.ip() + ":" + str( msg.port() )
	l += ", address: " + msg.address()
	l += ", typetag: " + msg.typetag()
	l += ", data:"
	for i in msg.arg_num():
		l += "[" + str(i) + ":" + msg.typetag().substr(i,1) + "] " + str(msg.arg(i)) + ", "
	lines.push_back( l )
	msg_received += 1
	txt_content = ""
	for l in lines:
		txt_content += l + "\n"
	set_text( txt_content )

func _ready():
	line_num = 0
	line_max = 10
	msg_received = 0
	txt_content = "no message received"
	set_text( txt_content )
	pass