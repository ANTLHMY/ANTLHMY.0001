extends Label


var 次数=0
func _ready() -> void:
	GGL.开始.connect(开始.bind())
func 开始():
	次数+=1
	text=str("第 %d 张"%[次数])

