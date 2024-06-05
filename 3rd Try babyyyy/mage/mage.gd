extends CharacterBody2D

@export var max_move_speed : float = 200.0
@export var acceleration : float = 0.5
@export var deceleration : float = 100

@export var jump_height : float = 500
@export var jump_t2p : float = 0.5
@export var jump_t2d : float = 0.5

@onready var jump_veloctiy : float = ((2.0* jump_height) / jump_t2p)*-1.0
@onready var jump_gravity : float = ((-2.0* jump_height) / (jump_t2p*jump_t2p))*-1.0
@onready var fall_gravity : float = ((-2.0* jump_height) / (jump_t2d*jump_t2d))*-1.0

@onready var direction : Vector2 = Vector2.ZERO
@onready var input_x_direction : int = 0


func _physics_process(delta):
	print(input_x_direction)
	get_input_direction()
	get_direciton()
	var gravity: float = get_gravity()
	if not is_on_floor():
		velocity.y +=   gravity * delta
	move_and_slide()

func get_input_direction():
	input_x_direction = Input.get_axis('left', 'right')

func get_direciton():
	direction.y = sign(velocity.y)
	direction.x = sign(velocity.x)
	
func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
