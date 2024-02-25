extends Node3D

@onready var enemy = $SubViewportContainer/SubViewport/enemy
@onready var enemy3 = $SubViewportContainer/SubViewport/enemy3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func reset():
	enemy.position = enemy.defaultPos
	enemy3.position = enemy3.defaultPos
	
	
