extends Node3D

@export
var plane: AeroBody3D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (plane.position.x >= 500):
		plane.wind = Vector3(100.0, 100.0, 100.0)
	
