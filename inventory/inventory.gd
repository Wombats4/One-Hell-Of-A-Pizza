extends Resource

class_name Inv

signal update

@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var empty_slots = slots.filter(func(slot): return slot.item == null)
	if !empty_slots.is_empty():
		empty_slots[0].item = item
	update.emit()
