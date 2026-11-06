extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var t := state.transform
	var screen_size := get_viewport_rect().size

	if t.origin.x > screen_size.x:
		t.origin.x = 0.0
	elif t.origin.x < 0.0:
		t.origin.x = screen_size.x
	if t.origin.y > screen_size.y:
		t.origin.y = 0.0
	elif t.origin.y < 0.0:
		t.origin.y = screen_size.y
	state.transform = t
