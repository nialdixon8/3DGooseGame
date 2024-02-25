extends Node3D

@onready var fallingPlatform = $fallingPlatform
@onready var fallingPlatform2 = $fallingPlatform2
@onready var fallingPlatform3 = $fallingPlatform3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func reset():
	fallingPlatform.position = fallingPlatform.defaultPos
	fallingPlatform.gravity = 0
	fallingPlatform.falling = false
	fallingPlatform.timer.stop()
	fallingPlatform2.position = fallingPlatform2.defaultPos
	fallingPlatform2.gravity = 0
	fallingPlatform2.falling = false
	fallingPlatform2.timer.stop()
	fallingPlatform3.position = fallingPlatform3.defaultPos
	fallingPlatform3.gravity = 0
	fallingPlatform3.falling = false
	fallingPlatform3.timer.stop()
