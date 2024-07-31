extends Label



func _ready() -> void:
	GGL.开始.connect(开始.bind())

func 开始():
	var txt=randi()%100
	text=str(txt)
	GGL.中奖号码=txt



