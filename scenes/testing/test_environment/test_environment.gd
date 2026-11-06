extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_size = self.get_viewport_rect().size
	var objects = self.get_children()
	
	for object in objects:
		print(object.position)
		if object.position.x + object.linear_velocity.x * delta >= screen_size.x:
			object.position.x = 0
		elif object.position.x + object.linear_velocity.x * delta < 0:
			object.position.x = screen_size.x
		
		if object.position.y + object.linear_velocity.y * delta >= screen_size.y:
			object.position.y = 0
		elif object.position.y + object.linear_velocity.y * delta < 0:
			object.position.y = screen_size.y
