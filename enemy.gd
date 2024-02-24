extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5
var rotation_direction = 0
var agroDistance = 10
@onready var player = get_parent().get_parent().get_node("player").get_node("CharacterBody3D")

@onready var raycast = $RayCast3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if raycast.is_colliding():
		player.die()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if not (player.global_position.z - global_position.z > agroDistance or player.global_position.z - global_position.z < -agroDistance or player.global_position.x - global_position.x > agroDistance or player.global_position.x - global_position.x < -agroDistance):
		velocity.x = clamp(player.global_position.x - global_position.x, -SPEED, SPEED)
		velocity.z = clamp(player.global_position.z - global_position.z, -SPEED, SPEED)
		
		if Vector2(velocity.z, velocity.x).length() > 0:
			rotation_direction = Vector2(velocity.z, velocity.x).angle()
			
		rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)
	
	move_and_slide()
