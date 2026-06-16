extends Node2D

const SlotClass = preload("res://scripts/slot.gd")
@onready var inventorySlots = $Grid
var holding_item:Node2D = null

func _ready() -> void:
	for inv_slot:Panel in inventorySlots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item: # place item
					var item_to_place = holding_item
					holding_item = null
					item_to_place.position = Vector2.ZERO
					slot.putIntoSlot(item_to_place)
				else: # pick up & swap
					var temp_item = slot.item
					slot.pickFromSlot()
					var item_to_place = holding_item
					holding_item = temp_item
					item_to_place.position = Vector2.ZERO
					slot.putIntoSlot(item_to_place)
					update_item_position()
			elif slot.item: # pick up empty handed
				holding_item = slot.item
				slot.pickFromSlot()
				update_item_position()
				
func _input(_event: InputEvent) -> void:
	if holding_item:
		update_item_position()

func update_item_position() -> void:
	if not holding_item:
		return
	holding_item.global_position = get_global_mouse_position() - Vector2(32, 32) 
