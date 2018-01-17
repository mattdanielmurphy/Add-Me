# Two Player Math Game

## Description

Both players start with 3 lives. They lose a life if they mis-answer a question. At the end of every turn, the game should output the new scores for both players, so players know where they stand.

The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.

## Classes

### Game_Initiator
- INPUT start game with optional RANGE (default 1-20)

### Players
- STORE: Current_player (Player_1 || Player_2)
- STORE: Player_1 lives (#/3)
- STORE: Player_2 lives (#/3)

### Question_generator
- STORE: past questions

- DO: generate addition question with two random numbers (RANGE)
	- if question is not unique, generate anew

### Game
- OUTPUT to Current_player new Question

- INPUT Answer > determine result and OUTPUT it to Current_player
	- incorrect answer > - 1 life in Players for Current_player

- DO: start next turn unless a player is dead
	- if dead: OUTPUT who won with their remaining lives