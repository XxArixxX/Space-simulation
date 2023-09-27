extends Camera3D

var speed = 200.0  # Скорость перемещения объекта
var move_speed: float = 100.0
var sensitivity = 0.2  # Чувствительность мыши
var max_pitch = deg_to_rad(80)  # Максимальный угол обзора вверх
var min_pitch = deg_to_rad(-80)  # Максимальный угол обзора вниз
var v = Vector3()
#var camera: Camera = $Camera3D

func _ready():
	pass
	#camera = $Camera3D

func _process(delta):
	var move_direction = Vector3(0, 0, 0)
	rotation_degrees.x = v.x
	rotation_degrees.y = v.y

	if Input.is_action_pressed("right"):
		move_direction += transform.basis.x
	if Input.is_action_pressed("left"):
		move_direction -= transform.basis.x
	if Input.is_action_pressed("backward"):
		move_direction += transform.basis.z
	if Input.is_action_pressed("forward"):
		move_direction -= transform.basis.z

	move_direction = move_direction.normalized() * move_speed * delta  # Нормализация для установки скорости в одном направлении

	#position += move_direction * speed * delta
	if Input.is_action_pressed("acceleration"):
		position += move_direction * 10
	else:
		position += move_direction
	#move_and_slide(move_direction)

func _input(event):
	if Input.is_action_pressed("rotation"):
		if event is InputEventMouseMotion:
			#rotate(global_transform.basis.y.normalized(), event.relative.x * 0.001)
			v.y -= (event.relative.x * 0.2)
			v.x -= (event.relative.y * 0.2)
			v.x = clamp(v.x,-80,90)
 # Перемещаем камеру в соответствии с направлением и скоростью
