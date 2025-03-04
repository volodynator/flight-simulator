# PlaneState.gd
extends Resource

# Abstract class for state of the plane
class_name PlaneState

# Abstract method for changing to the other state
func change_state(plane : AeroBody3D):
	pass
