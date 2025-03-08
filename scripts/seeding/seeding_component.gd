extends Node3D
class_name SeedingComponent

@onready var plane: AeroBody3D
var seeding_area : Vector3 = Vector3(20.0, 2, 20.0)
@export var offset_distance : float = 10.0

func create_seeding_area() -> Area3D:
	var area = Area3D.new()
	area.name = "Seeding Area"
	var shape = BoxShape3D.new()
	shape.extents = seeding_area * 0.5
	
	var collision = CollisionShape3D.new()
	collision.shape = shape
	
	area.add_child(collision)
	
	var plane_mesh = BoxMesh.new()
	var mesh_material = StandardMaterial3D.new()
	var mesh_instance = MeshInstance3D.new()
	
	mesh_material.albedo_color = Color(1, 0, 0, 0.5)
	plane_mesh.material = mesh_material

	plane_mesh.size = seeding_area
	
	mesh_instance.mesh = plane_mesh
	
	area.add_child(mesh_instance)
	
	# Добавляем область в сцену перед установкой позиции
	plane.get_parent().add_child(area)
	
	# Используем call_deferred для установки позиции в следующем кадре
	call_deferred("set_area_position", area)
	
	print("Seeding")
	return area

func set_area_position(area: Area3D):
	if is_instance_valid(plane) and plane.is_inside_tree():
		var velocity = plane.linear_velocity
		var direction = -velocity.normalized()
		var offset = direction * offset_distance
		
		var target_position = plane.global_position + offset
		var ground_position = find_ground_position(target_position)
		
		area.global_position = ground_position
		area.global_position.y += seeding_area.y * 0.5

func find_ground_position(start_position: Vector3) -> Vector3:
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(
		start_position + Vector3(0, 1000, 0),
		start_position + Vector3(0, -1000, 0),
		1  # Настройте это в соответствии с вашей маской коллизии для земли
	)
	
	var result = space_state.intersect_ray(query)
	if result:
		return result.position
	else:
		return start_position  # Возвращаем исходную позицию, если земля не найдена

	
func delete_seeding_area(area : Area3D) -> void:
	plane.get_parent().remove_child(area)
