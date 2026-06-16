extends Panel

var ItemClass = preload("res://scenes/item.tscn")
var item = null

func _ready() -> void:
	if randi() % 2 == 0:
		item = ItemClass.instantiate()
		add_child(item)
