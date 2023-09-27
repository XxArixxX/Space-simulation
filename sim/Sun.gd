extends RigidBody3D

var G = 6.6743 * pow(10, -2)
@export var initial_velocity: Vector3 = Vector3.ZERO
@export var is_sun: bool = false
@export var pos = false

func _ready():
	linear_velocity = initial_velocity
	Globals.celestial_bodies.append(self)

func _physics_process(delta):
	if pos == true:
		Globals.pos = position
	var delta_scaled = delta * Globals.timeModifier
	Engine.time_scale = Globals.timeModifier
	if !is_sun:
		Gravity(delta)
	else:
		linear_velocity = Vector3.ZERO
		
func Gravity(delta):
	#var delta_scaled = delta * Globals.timeModifier
	for otherbody in Globals.celestial_bodies:
		if otherbody != self and otherbody.is_sun == true:
			var otherbodyMass = otherbody.mass
			var direction = self.global_position - otherbody.global_position
			var distance = direction.length()
			
			var forceMag = G * ((mass * otherbodyMass) / (distance * distance))
			var force = direction.normalized() * forceMag
			#var force_scaled = force * delta
			
			apply_central_force(-force)
			#move_and_collide(-force)
			position.y = 0

