extends Control

var time = 0
var nickname = null

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("usernamegroup")
	pass # Replace with function body.
	
func display(t):
	if time == 0 and t != time:
		time = t
		# SilentWolf.Scores.save_score(nickname, time)
		
	var timeLabel = get_node("finishBox/MarginContainer/VBoxContainer/timeLabel")
	var text = "Time: %f"
	timeLabel.text = text % time
	
	self.visible = true

func set_name1(nick):
	nickname = nick


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_over_pressed():
	get_tree().get_root().get_node("CanvasLayer/Node3D").reset()
	get_tree().change_scene_to_file("res://level3.tscn")


func _on_next_level_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
