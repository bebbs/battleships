#Battleships!

Andy Newman (andyg72) and Josh Bebbington (bebbs)

This was our project for Week 2 of Makers Academy. Our task was to design and implement the classes and their methods for a Battleships-style game. Our learning objectives were to use London-style test driven development (TDD) with RSpec, object-oriented design principles (OOP), and Ruby.

##How to play

To play the game in IRB:
```shell
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'
require './lib/fleet'
```
To set up a player:
```shell
player1_name = Player.new('player1_name')
```
To display your grid:
```shell
player1_name.board.display_own_grid
```
To display a view of your shots at your opponents grid:
```shell
player2_name.board.display_opponent_grid
```
To place ships:
```shell
player1_name.board.place_ship(player1_name.fleet.ship_array[0], :A01, :horizontal)
```
There are 9 ships you can place (ship_array[0] to ship_array[9]), cells from :A01 to :J10, and orientation of :horizontal or :vertical.

To shoot, call receive_shot with a grid reference on your opponent:
```shell
player2_name.receive_shot(:A01)
```
*The game is won when all of a players ships are sunk.*

##Domain Model / CRC

###Cell
Responsibility | Collaborators
---------------|--------------
be hit         | Player
damage ship    | Ship
place ships    | Board, (Fleet), Grid

###Board
Responsibility | Collaborators
---------------|--------------
display game   | Player, Cells
place Ships    | Player, Fleet, Cells

###Ship
Responsibility | Collaborators
---------------|--------------
be placed      | Player, Fleet, Board, Cells
be sunk        | Cells, Fleet
be damaged     | Cell, Player

###Fleet
Responsibility | Collaborators
---------------|--------------
place Ships    | Player, Board, Cells, Ship
create Ships   | Ships
declare winner | Ship, Player

###Player
Responsibility | Collaborators
---------------|--------------
hit cell       | Cell
place Ships    | Fleet, Ships, Cells, Board
display game   | Player, Cells, Board



