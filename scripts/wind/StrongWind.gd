# StrongWind.gd
extends WindState

# State for the strong wind
class_name StrongWind

# Override
func apply_wind(plane : AeroBody3D):
	# Strong wind
	var wind : Vector3 = Vector3(50.0, 30.0, 40.0)
	# Apply wind
	plane.wind = wind
