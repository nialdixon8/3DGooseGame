extends CharacterBody3D

const SPEED = 5
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.002
@onready var downRay = $RayCast3D
@onready var attackRay = $attackRay
@onready var attackRay2 = $attackRay2
@onready var attackRay3 = $attackRay3
@onready var timer = $Timer
var platform = null

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var anim = $goose2/AnimationPlayer

var attackReady = true
var rotation_direction = 0
var velocityY = 0
var pushed = false


func _physics_process(delta):
	if Input.is_action_just_pressed("attack") and attackReady:
		attack()
	
	if downRay.is_colliding():
		platform = downRay.get_collider().get_parent()
		if platform.name == "goal":
			if get_parent().level == 2:
				get_tree().change_scene_to_file("res://level3.tscn")
			if get_parent().level == 1:
				get_tree().change_scene_to_file("res://level2.tscn")
			
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if anim.is_playing():
			anim.stop()
		velocity.y = JUMP_VELOCITY
		anim.play("jumpAction")
	if position.y < -5:
		die()
	if not pushed:
		velocity.x = 0
		velocity.z = 0
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if Input.is_action_pressed("ui_left"):
			if velocity.y == 0:
				if anim.is_playing() and anim.current_animation != "neckAttackAction":
					anim.play("runAction")
				if not anim.is_playing():
					anim.play("runAction")
			velocity.x -= SPEED
		if Input.is_action_pressed("ui_right"):
			if velocity.y == 0:
				if anim.is_playing() and anim.current_animation != "neckAttackAction":
					anim.play("runAction")
				if not anim.is_playing():
					anim.play("runAction")
			velocity.x += SPEED
		if Input.is_action_pressed("ui_up"):
			if velocity.y == 0:
				if anim.is_playing() and anim.current_animation != "neckAttackAction":
					anim.play("runAction")
				if not anim.is_playing():
					anim.play("runAction")
			velocity.z -= SPEED
		if Input.is_action_pressed("ui_down"):
			if velocity.y == 0:
				if anim.is_playing() and anim.current_animation != "neckAttackAction":
					anim.play("runAction")
				if not anim.is_playing():
					anim.play("runAction")
			velocity.z += SPEED
		if velocity == Vector3.ZERO:
			if anim.is_playing() and anim.current_animation != "neckAttackAction":
				anim.play("idleAction")
			if not anim.is_playing():
				anim.play("idleAction")
		if Vector2(velocity.z, velocity.x).length() > 0:
			rotation_direction = Vector2(velocity.z, velocity.x).angle()
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
	rotation.y = lerp_angle(rotation.y, rotation_direction, delta * 10)

	move_and_slide()

func attack():
	attackReady = false
	timer.start()
	if anim.is_playing() and not anim.current_animation == "neckAttackAction":
		anim.stop()
	anim.play("neckAttackAction")
	if attackRay.is_colliding():
		if attackRay.get_collider().name.contains("enemy"):
			attackRay.get_collider().push(attackRay.get_collider().global_position - global_position)
	elif attackRay2.is_colliding():
		if attackRay2.get_collider().name.contains("enemy"):
			attackRay2.get_collider().push(attackRay2.get_collider().global_position - global_position)
	elif attackRay3.is_colliding():
		if attackRay3.get_collider().name.contains("enemy"):
			attackRay3.get_collider().push(attackRay3.get_collider().global_position - global_position)

func die():
	pushed = false
	position = Vector3(0,1,0)
	if get_parent().level == 1:
		get_parent().get_parent().get_parent().get_parent().reset()
	else:
		get_parent().get_parent().reset()

func push(direction):
	velocity.x = 0
	velocity.z = 0
	pushed = true
	velocity.x += direction.x * 4
	velocity.z += direction.y * 4
	velocity.y = 3

func _on_timer_timeout():
	attackReady = true
