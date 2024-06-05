extends State
class_name Running

func enter():
	pass
	
func exit():
	pass

func update(_delta: float):
	if Input.is_action_just_pressed('up'):
		transitioned.emit('jumping')
	if subject.input_x_direction == 0:
		print('hehe')
		transitioned.emit('idle')
		
func physics_update(_delta: float):
	subject.velocity.x = lerp(
		subject.velocity.x, 
		subject.max_move_speed*subject.input_x_direction, 
		subject.acceleration
	)
