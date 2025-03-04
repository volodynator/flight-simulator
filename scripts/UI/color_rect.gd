extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visibility_changed() -> void:
	blink()

func blink():
	while true:
		var tween = create_tween()
		tween.tween_property(self, "modulate", Color.ORANGE_RED, 0.5)
		await tween.finished
		tween = create_tween()
		tween.tween_property(self, "modulate", Color.DARK_RED, 0.5)
		await tween.finished
