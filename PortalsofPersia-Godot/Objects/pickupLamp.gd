extends AbstractPickup

func doThings() -> void:
	print("woaw 2!")
	get_parent().get_node("Player").lamp = true;
	queue_free()
