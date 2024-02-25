extends Node

var time = 0


func _process(delta):
	time += delta
	
func resetTime():
	time = 0
	
func getTime():
	return time
