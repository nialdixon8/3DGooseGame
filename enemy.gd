extends CharacterBody3D

@export var defaultPos:Vector3
const SPEED = 3.0
const JUMP_VELOCITY = 4.5
var rotation_direction = 0
@onready var player = get_parent().get_node("player").get_node("CharacterBody3D")

@onready var raycast = $RayCast3D
@onready var raycast2 = $RayCast3D2
@onready var anim = $enemyGoose/AnimationPlayer
@onready var timer = $Timer

@export var platform:Node3D
var attack = true
var pushed = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction

func _physics_process(delta):
	if raycast.is_colliding() and attack:
		if raycast.get_collider().get_parent().name == "player":
			timer.start()
			attack = false
			if anim.is_playing():
				anim.stop()
			anim.play("neckAttackAction")
			direction = Vector2(player.global_position.x - global_position.x,player.global_position.z - global_position.z)
			if not player.pushed:
				player.push(direction)
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if player.platform == platform:
		if not pushed:
			velocity.x = 0
			velocity.z = 0
			velocity.x = clamp(player.global_position.x - global_position.x, -SPEED, SPEED)
			velocity.z = clamp(player.global_position.z - global_position.z, -SPEED, SPEED)
			if velocity.x != 0 or velocity.z != 0:
				if anim.is_playing() and anim.current_animation != "neckAttackAction":
					anim.play("runAction")
				if not anim.is_playing():
					anim.play("runAction")
			if velocity.x == 0 and velocity.z == 0:
				if not anim.is_playing():
					anim.play("idleAction")
			if Vector2(velocity.z, velocity.x).length() > 0:
				rotation_direction = Vector2(velocity.z, velocity.x).angle()
			rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)
		else:
			if velocity.x > 0:
				velocity.x -= 0.05
			elif velocity.x < 0:
				velocity.x += 0.05
			if velocity.z > 0:
				velocity.z -= 0.05
			elif velocity.z < 0:
				velocity.z += 0.05
			if abs(velocity.x) <= 1.6 and abs(velocity.z) <= 1.6:
				pushed = false
	else:
		if not anim.is_playing():
			anim.play("idleAction")
		velocity.x = 0
		velocity.z = 0
		
	
	move_and_slide()

func push(direction):
	velocity.x = 0
	velocity.z = 0
	pushed = true
	velocity.x += direction.x * 2
	velocity.z += direction.z * 2
	velocity.y = 3

func _on_timer_timeout():
	attack = true
