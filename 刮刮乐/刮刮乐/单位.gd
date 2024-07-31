extends Label


func _ready() -> void:
	GGL.改变.connect(改变.bind())

func 改变():
	text=str("%d单位"%GGL.单位)

