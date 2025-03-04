extends Area3D

# Represents Area3D that can change wind applied to the plane
class_name WindArea

@export var wind_state: WindState

# Apply wind when entering area
func _on_body_entered(body):
	if body.name == "Plane":
		body.changeWindState(wind_state)

# When leaving area reseting wind to initial one
func _on_body_exited(body):
	if body.name == "Plane":
		body.resetWindState()
