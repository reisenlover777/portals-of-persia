extends Node2D

func _ready() -> void:
	if(MuController.stream != preload("res://assets/mu_ManaTwoPart2_idle.mp3")):
		MuController.stop()
		MuController.stream = preload("res://assets/mu_ManaTwoPart2_idle.mp3")
		MuController.play()
