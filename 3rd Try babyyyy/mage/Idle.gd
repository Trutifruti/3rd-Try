extends Ground_State
class_name Idle

	
func exit():
	pass

func update(_delta: float):
	super.update(_delta)
	if subject.input_x_direction != 0:
		transitioned.emit(self, 'running')
	if not subject.is_on_floor():
		transitioned.emit(self, 'falling')

func physics_update(_delta: float):
	if subject.velocity.x != 0:
		subject.velocity.x = lerp(subject.velocity.x, 0.0, 0.5)
