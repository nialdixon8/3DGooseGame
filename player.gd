extends CharacterBody3D

const SPEED = 5
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.002

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var anim = $goose1/AnimationPlayer

var rotation_direction = 0
var velocityY = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	velocity.x = 0
	velocity.z = 0
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if anim.is_playing():
			anim.stop()
		velocity.y = JUMP_VELOCITY
		anim.play("jumpAction")
	if position.y < -5:
		die()
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#	if direction:
#		velocity.x = direction.x * SPEED
#		velocity.z = direction.z * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.z -= SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.z += SPEED
	if Vector2(velocity.z, velocity.x).length() > 0:
		rotation_direction = Vector2(velocity.z, velocity.x).angle()
		
	rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)

	move_and_slide()

func die():
	position = Vector3(0,1,0)
