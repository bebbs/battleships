#Battleships!

Andy Newman (andyg72) and Josh Bebbington (bebbs)

##Domain Model / CRC

###Cell
Responsibility | Collaborators
---------------|--------------
be Shot        | Player, Ship
place Ships    | Player, Fleet, Grid
display game   | Grid, Player

###Grid
Responsibility | Collaborators
---------------|--------------
display game   | Player, Cells
place Ships    | Player, Fleet, Cells

###Ship
Responsibility | Collaborators
---------------|--------------
be Placed      | Player, Fleet, Grid, Cells
be Sunk        | Cells, Player, Fleet
be hit by Shot | Cell

###Fleet
Responsibility | Collaborators
---------------|--------------
place Ships    | Player, Grid, Cells, Ship
create Ships   | Ships
sink Ship      | Cells, Ship, Player

###Player
Responsibility | Collaborators
---------------|--------------
shoot          | Cell
place Ships    | Fleet, Ships, Cells, Grid
display game   | Player, Cells, Grid



