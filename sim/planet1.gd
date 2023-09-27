extends CSGSphere3D

@export var rotation_speed : float = 10  # Скорость вращения планеты
#@export var orbit_speed = 0.05    # Скорость вращения вокруг солнца
#@export var distance_from_sun = 5.0  # Расстояние от солнца

func _process(delta):
	# Вращаем планету вокруг оси Y (вертикальная ось)
	rotate_y(deg_to_rad(rotation_speed * delta))
	# Вычисляем новое положение планеты вокруг солнца
	#var new_position = Vector3(distance_from_sun, 0, 0).rotated(Vector3(0, 1, 0), orbit_speed * delta)
	
	# Устанавливаем позицию планеты относительно солнца
	#transform.origin = new_position
