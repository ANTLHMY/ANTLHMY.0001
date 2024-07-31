extends Node

signal 开始
signal 结束
signal 改变
signal 中奖
var 中奖号码:int
var 单位:=1000
var 没有中奖:int
var 提示文本框=preload("res://刮刮乐/提示文本框.tscn").instantiate()
const 提示文本 = preload("res://刮刮乐/提示文本.tscn")

func _ready() -> void:
	中奖.connect(HS中奖.bind())
	add_child(提示文本框)
	
func HS中奖():
	if 没有中奖>=25:
		GGL.print提示("没有中奖",Color(1,0,0,1))

func print提示(文本,颜色=Color(0,1,0,1)):
	var 提示=提示文本.instantiate()
	提示.text=str(文本)
	提示.set_modulate(颜色)
	add_child(提示)
	var color
	if 颜色==Color(1,0,0,1):
		color="red"
	elif 颜色==Color(0,1,0,1):
		color="green"
	提示文本框.append_text("[color=%s]%s\n"%[color,文本])


