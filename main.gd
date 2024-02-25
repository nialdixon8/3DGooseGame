extends Node3D

@onready var enemy = $SubViewportContainer/SubViewport/enemy
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
	
	
