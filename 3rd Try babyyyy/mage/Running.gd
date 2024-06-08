extends Ground_State
class_name Running
	
func exit():
	pass

func update(_delta: float):
	super.update(_delta)
	if subject.input_x_direction == 0:
		transitioned.emit(self, 'idle')
		
func physics_update(_delta: float):
	subject.velocity.x = lerp(
		subject.velocity.x, 
		subject.max_move_speed*subject.input_x_direction, 
		subject.acceleration
	)
