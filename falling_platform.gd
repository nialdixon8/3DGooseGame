extends Node3D

var falling = false
var gravity = 0
@onready var timer = $Timer
@onready var particle = $GPUParticles3D
@onready var particle2 = $GPUParticles3D2

@export var defaultPos:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= gravity * delta
	if falling:
		gravity += 0.25


func _on_area_3d_body_entered(body):
	particle.emitting = true
	particle2.emitting = true
	timer.start()
	


func _on_timer_timeout():
	falling = true
