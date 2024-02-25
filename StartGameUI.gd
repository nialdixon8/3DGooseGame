extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	
	var camGame = get_tree().get_root().get_node("RootCanvas/Node3D/SubViewportContainer/SubViewport/cameraNode/CameraGame")
	var camStart = get_tree().get_root().get_node("RootCanvas/Node3D/SubViewportContainer/SubViewport/cameraNode/CameraStart")
	camGame.set_current(true)
	
	var startScreen = get_tree().get_root().get_node("RootCanvas/StartGameUI")
	startScreen.visible = false
	
	
	

func _on_exit_pressed():
	get_tree().quit()
