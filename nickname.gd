extends Node

var nickname = null

func _ready():
	add_to_group("usernamegroup")

func set_nickname(nick):
	nickname = nick
	get_tree().call_group("usernamegroup", "set_name1", nickname)
	
func get_nickname():
	return nickname
