extends Button



func _ready() -> void:
	GGL.开始.connect(开始.bind())
	GGL.结束.connect(结束.bind())

func 开始():
	visible=0
	GGL.print提示("%d -消耗100单位 = %d"%[GGL.单位,GGL.单位-100],Color(1,0,0,1))
	GGL.单位-=100

	GGL.改变.emit()
func 结束():
	visible=1



func _on_button_up() -> void:
	if GGL.单位>=100:
		GGL.开始.emit()
	else:
		GGL.print提示("你没钱了",Color(1,0,0,1))
