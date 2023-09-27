extends RigidBody3D

@export var orbit_speed: float = 0.05    # Скорость вращения вокруг солнца
@export var distance_from_sun: float = 5.0  # Расстояние от солнца

func _process(delta):
	# Вращаем планету вокруг оси Y (вертикальная ось)
	# Вычисляем новое положение планеты вокруг солнца
	#var direction = self.global_position - distance_from_sun.global_position
	#var new_position = Vector3(0, 0, distance_from_sun).rotated(Vector3(0, 0, 1), orbit_speed * delta)
	#var force = direction.normalized() * new_position
	
	# Устанавливаем позицию планеты относительно солнца
	#transform.origin = new_position
	#apply_central_force(new_position)
	pass
