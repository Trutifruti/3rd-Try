extends State
class_name Air_State

@export var jump_straif: Timer
@export var landing_jump: Timer

func _ready():
	jump_straif.start()

func physics_update(_delta: float):
	if Input.is_action_just_pressed('up'):
		landing_jump.start()
		
func air_straif():
	if not jump_straif.is_stopped():
		subject.velocity.x = lerp(
			subject.velocity.x, 
			subject.max_straif_speed*subject.input_x_direction, 
			subject.straif_acceleration
		)
		
