extends Control


@onready var 覆盖层: TextureRect = $"Control/覆盖层"
var 画笔图像 = preload("res://资源/图片/圆形256.png")
var 上一帧鼠标坐标=0
var 当前鼠标坐标=0
var 鼠标键按下:=false
var 旧纹理
var 旧图像对象:Image
var 像素颜色
var BL结束:bool
# 原始未刮开的图像纹理  
var 原始刮刮乐纹理: ImageTexture
# 当前的刮刮乐纹理（可能是修改过的）  
var 当前刮刮乐纹理: ImageTexture 


func _ready() -> void:
	# 加载原始图像并创建纹理 
	var 原始图像 = preload("res://资源/图片/刮刮乐04.png")
	原始刮刮乐纹理 = ImageTexture.create_from_image(原始图像)
	画笔图像.resize(50,50)
	GGL.开始.connect(初始化刮刮乐.bind())
	GGL.结束.connect(结束.bind())
	GGL.开始.emit()


func 初始化刮刮乐():
	BL结束=false
	# 初始时将当前纹理设置为原始纹理  
	当前刮刮乐纹理 = 原始刮刮乐纹理.duplicate()  
	覆盖层.texture = 当前刮刮乐纹理


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			鼠标键按下=true
			绘制刮刮效果()
		else:
			鼠标键按下=false
			上一帧鼠标坐标=0
	if event is InputEventMouseMotion and 鼠标键按下:
		绘制刮刮效果()


func 绘制刮刮效果():
	当前鼠标坐标=覆盖层.get_local_mouse_position()/1.5-Vector2(25,25)
	if 上一帧鼠标坐标 is Vector2:
		var 次数=(当前鼠标坐标-上一帧鼠标坐标).length()/25
		if 次数<2:
			次数=2
		var kkk=(当前鼠标坐标-上一帧鼠标坐标)/次数
		for i in range(int(次数)):
			在覆盖层上绘制(画笔图像,覆盖层,上一帧鼠标坐标+kkk*i)
	在覆盖层上绘制(画笔图像,覆盖层,当前鼠标坐标)
	上一帧鼠标坐标=当前鼠标坐标
	if 旧图像对象:
		旧图像对象.resize(1,1,4)
		像素颜色=旧图像对象.get_pixel(0,0)
		if min(像素颜色.r,像素颜色.g,像素颜色.b)>0.98:
			if !BL结束:
				GGL.结束.emit()
			旧图像对象=null


func 在覆盖层上绘制(画笔图像,覆盖层,当前鼠标坐标):
	旧纹理=覆盖层.texture
	旧图像对象=旧纹理.get_image()
	旧图像对象.blend_rect(画笔图像,Rect2(Vector2.ZERO,画笔图像.get_size()),当前鼠标坐标)
	旧纹理.set_image(旧图像对象)


func 结束():
	BL结束=true



