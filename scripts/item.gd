extends Node2D

func _ready() -> void:
	if randi() % 2 == 0:
		$Sprite.texture = load("res://textures/Circle.png")
	else:
		$Sprite.texture = load("res://textures/Cross.png")
