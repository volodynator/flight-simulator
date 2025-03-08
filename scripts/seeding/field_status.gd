extends MeshInstance3D

@export var pulse_color: Color = Color.YELLOW
var pulse_speed: float = 2.0

var material_instance: StandardMaterial3D

func _ready():
	if mesh and mesh.surface_get_material(0):
		material_instance = mesh.surface_get_material(0).duplicate()
		mesh.surface_set_material(0, material_instance)

func _process(delta):
	if material_instance:
		var intensity = (sin(Time.get_ticks_msec() * 0.001 * pulse_speed) + 1.0) * 0.5
		material_instance.albedo_color = pulse_color.lerp(Color.WHITE, intensity)
