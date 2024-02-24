extends Node3D

@export_group("Properties")

@onready var camera = $Camera3D

var target
var camera_rotation = Vector3(-30,0,0)
var zoom = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_parent().get_node("player").get_node("CharacterBody3D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = self.position.lerp(target.position, delta * 4)
	rotation_degrees = rotation_degrees.lerp(camera_rotation, delta * 6)
	
	camera.position = camera.position.lerp(Vector3(0, 0, zoom), 8 * delta)
