# Windstate.gd
extends Resource

# Abstract class for different types of wind
class_name WindState

# Abstract method for realisation of different types of wind
func apply_wind(plane : AeroBody3D):
	pass
