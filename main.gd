extends Node3D

@onready var enemy = $enemy
@onready var enemy2 = $enemy2
@onready var enemy3 = $enemy3
@onready var fallingPlatform = $fallingPlatform
@onready var fallingPlatform2 = $fallingPlatform2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func reset():
	enemy.position = enemy.defaultPos
	enemy2.position = enemy2.defaultPos
	enemy3.position = enemy3.defaultPos
	fallingPlatform.falling = false
	fallingPlatform2.falling = false
	fallingPlatform.gravity = 0
	fallingPlatform2.gravity = 0
	fallingPlatform.timer.stop()
	fallingPlatform2.timer.stop()
	fallingPlatform.position = fallingPlatform.defaultPos
	fallingPlatform2.position = fallingPlatform2.defaultPos
	
	
