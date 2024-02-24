extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5
var rotation_direction = 0
@onready var player = get_parent().get_node("player").get_node("CharacterBody3D")

@onready var raycast = $RayCast3D

@export var platform:Node3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	velocity.x = 0
	velocity.z = 0
	if raycast.is_colliding():
		player.die()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if player.platform == platform:
		velocity.x = clamp(player.global_position.x - global_position.x, -SPEED, SPEED)
		velocity.z = clamp(player.global_position.z - global_position.z, -SPEED, SPEED)
		
		if Vector2(velocity.z, velocity.x).length() > 0:
			rotation_direction = Vector2(velocity.z, velocity.x).angle()
			
		rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)
	
	
	move_and_slide()
