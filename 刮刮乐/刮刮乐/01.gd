extends Control
@onready var label: Label = $Label
@onready var label2: Label = $Label2
var kk=0
var num=[100,200,400,750,1000,1500,3000,4500,7500,10000,50000,100000,500000,1000000]



func _ready() -> void:
	GGL.开始.connect(开始.bind())
	GGL.结束.connect(结束.bind())




func 开始():
	kk=0
	label.modulate=Color(1,1,1,1)
	label2.modulate=Color(1,1,1,1)
	label.text=str(randi()%100)
	var 索引=0
	var 随机=随机()
	if 随机<(num.size()-1):
		索引=随机
	else:
		索引=num.size()-1
	var 映射=num[索引]
	label2.text=str("￥%d"%映射)

func 随机():
	if !randi()%2:
		随机()
		kk+=1
	return kk

func 结束():
	if int(label.text)==GGL.中奖号码:
		label.modulate=Color(1,0,0,1)
		label2.modulate=Color(1,0,0,1)
		var 单位=GGL.单位
		GGL.单位+=int(label2.text)
		GGL.改变.emit()
		GGL.print提示("%d +中奖%d单位 = %d"%[单位,int(label2.text),GGL.单位])
	elif int(str(name))==1:
		GGL.没有中奖=1
	elif int(str(name))==25:
		GGL.没有中奖+=1
		GGL.中奖.emit()
	else:
		GGL.没有中奖+=1

	
