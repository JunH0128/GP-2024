extends Sprite2D

@export var explostion_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var f:float
	var g:float
	var h:float
	
	f = 10 # assignment
	g = 20
	h = 3
	
	f += 2 # add 2 to f
	f = f + 2
	g = f -5
	
	h *= 2
	g = h / 3
	
	var i:int
	var j:int
	var k:int
	
	i = 10
	j = 4
	k = i / j
	
	print(i)
	print(j)
	print(k)
	
	print(f)
	print(g)
	print(h)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	DebugDraw2D.set_text("pos", position)
	DebugDraw2D.set_text("glob_pos", global_position)
	DebugDraw2D.set_text("rotation", rotation)
	DebugDraw2D.set_text("glo_rotation", global_rotation)
	
	rotation += 0.1
	
	position.x += 1
	#position.y += 1
	
	var wall:Node2D = get_node("../../wall")
	
	DebugDraw2D.set_text("dist", wall.global_position.distance)
	
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("collided")
	
	if area.name == "wall" or area.name == "wall2":
	print(area)
	
	var explosion:GPUParticles2D = explosion_scene.instantiate
	explosion.global_position = area.global_position
	explosion.emitting = true
	getparent().add_child(explosion)
	area.queue_free()
	
	pass # Replace with function body.
