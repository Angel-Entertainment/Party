extends RigidBody2D


@export var linear_movement_force = 100000 # N
@export var angular_movement_force = 1000000 # Nm


# Init
func _ready() -> void:
	pass # Replace with function body.


# Every frame
func _process(delta: float) -> void:
	pass


# Every physics tick
func _physics_process(delta: float) -> void:
	var direction_nt = Input.get_vector("backward", "forward", "leftward", "rightward")
	var direction_cart = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	self.apply_force(direction_nt.rotated(self.rotation) * linear_movement_force)
	self.apply_force(direction_cart * linear_movement_force)
	
	var correction_torque = get_angle_to(get_global_mouse_position()) * angular_movement_force
	self.apply_torque(correction_torque)
	
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
