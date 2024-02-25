extends Node

func _ready():
  SilentWolf.configure({
	"api_key": "YZJPjDQzNH4qSmeffiHR98NKnKClfPxw2oHvhyMf",
	"game_id": "gooseplatformer",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/MainPage.tscn"
  })
