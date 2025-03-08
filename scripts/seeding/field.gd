extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	if area.name == "Seeding Area":
		$"Field Status".pulse_color = Color.CHARTREUSE
		$"Field Status".pulse_speed = 5.0
		await get_tree().create_timer(2).timeout
		remove_child($"Field Status")
		print("Contact")
		
