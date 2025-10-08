# autoloads/GameState.gd
extends Node

# A signal to let other parts of the game know the state has changed.
signal state_changed(new_state)

# The different states our game can be in.
enum State {
	START, # Or MENU
	PLAY,
	END # Or SCORE_SCREEN
}

# The current state of the game.
var current_state: State:
	set(new_value):
		current_state = new_value
		state_changed.emit(current_state)

# --- Your future variables will go here ---
var game_time: float = 0.0 # For the timer system [cite: 90]
var abilities_sacrificed: Array[String] = [] # To track sacrifices [cite: 101]

func _ready():
	# The game always starts at the beginning.
	current_state = State.START

func _process(delta):
	# We only want the timer to run when the game is being played.
	if current_state == State.PLAY:
		game_time += delta
