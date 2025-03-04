# NoWind.gd
extends WindState

# State when there is no wind
class_name NoWind

# Override
func apply_wind(plane : AeroBody3D):
	# There is no wind
	var wind : Vector3 = Vector3.ZERO
	# Apply wind
	plane.wind = wind
	
