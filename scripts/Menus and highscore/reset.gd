extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	HIGHSCORE_SINGLETON.SCORE = null
	HIGHSCORE_SINGLETON.START_TIME = null
