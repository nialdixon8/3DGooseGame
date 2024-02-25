extends Node3D

@onready var enemy = $SubViewportContainer/SubViewport/enemy
@onready var enemy2 = $SubViewportContainer/SubViewport/enemy2
@onready var enemy3 = $SubViewportContainer/SubViewport/enemy3
@onready var enemy4 = $SubViewportContainer/SubViewport/enemy4
@onready var player = $SubViewportContainer/SubViewport/player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func reset():
	player.global_position = Vector3(0,1,0)
	enemy.position = enemy.defaultPos
	enemy2.position = enemy2.defaultPos
	enemy3.position = enemy3.defaultPos
	enemy4.position = enemy4.defaultPos
	
	
