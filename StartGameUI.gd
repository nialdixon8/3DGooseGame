extends Control

var nickname = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
	var scores = sw_result.scores
	scores.reverse()
	var firstlab = get_node("StartBox/MarginContainer/HBoxContainer/VBoxContainer2/firstLabel")
	var secondlab = get_node("StartBox/MarginContainer/HBoxContainer/VBoxContainer2/secondLabel")
	var thirdlab = get_node("StartBox/MarginContainer/HBoxContainer/VBoxContainer2/thirdLabel")
	var fourthlab = get_node("StartBox/MarginContainer/HBoxContainer/VBoxContainer2/fourthLabel")
	
	
	if (0 < len(scores)):
		firstlab.text =  scores[0]["player_name"] +" " +str(scores[0]["score"]).pad_decimals(2)
	if (1 < len(scores)):
		secondlab.text = scores[1]["player_name"] +" "+ str(scores[1]["score"]).pad_decimals(2)
	if (2 < len(scores)):
		thirdlab.text = scores[2]["player_name"] +" "+ str(scores[2]["score"]).pad_decimals(2)
	if (3 < len(scores)):
		fourthlab.text =  scores[3]["player_name"] + " " + str(scores[3]["score"]).pad_decimals(2)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	
	var camGame = get_tree().get_root().get_node("RootCanvas/Node3D/SubViewportContainer/SubViewport/cameraNode/CameraGame")
	var camStart = get_tree().get_root().get_node("RootCanvas/Node3D/SubViewportContainer/SubViewport/cameraNode/CameraStart")
	camGame.set_current(true)
	
	var stopwatch = get_tree().get_root().get_node("RootCanvas/stopwatch")
	var time = stopwatch.resetTime()
	
	var startScreen = get_tree().get_root().get_node("RootCanvas/StartGameUI")
	startScreen.visible = false
	

	
	var player = get_tree().get_root().get_node("RootCanvas/Node3D/")
	

func _on_exit_pressed():
	get_tree().quit()




func _on_nickname_text_changed():
	var textedit = get_node("StartBox/MarginContainer/HBoxContainer/VBoxContainer/nickname")
	var nicknamegd = get_tree().get_root().get_node("RootCanvas/nickname/")
	var text = textedit.text
	nicknamegd.set_nickname(text)
