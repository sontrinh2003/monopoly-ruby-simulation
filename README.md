# Monopoly Simulator

## Overview

This is a command-line Ruby application that simulates the game Monopoly based on predefined dice rolls.

The game follows a simplified rule set where:

* All players follow a fixed turn order
* Dice rolls are predetermined (loaded from file)
* Property purchases and rent payments are mandatory
* The game ends when a player goes bankrupt

---

## How to Run

Ensure you have Ruby installed, then run:

```bash
ruby monopoly.rb
```

You will be prompted to enter a dice rolls file:

```
Enter the filename of dice rolls data: rolls_1.json
```

---

## Optional Debug Mode

You can enable turn-by-turn logging using the --debug flag:

```
ruby monopoly.rb --debug
```

This will output detailed logs of each turn, including:

* Player movements and locations
* Property purchases
* Rent payments
* Money changes

## Example Output

```
Game Over!
Summary:
Peter: $40, Position: The Grand Tofu, Bankrupt: No
Billy: $17, Position: Massizim, Bankrupt: No
Charlotte: $1, Position: The Grand Tofu, Bankrupt: No
Sweedal: $0, Position: Lanzhou Beef Noodle, Bankrupt: Yes
WINNER: Peter
```

---

## Project Structure

The application is organised into the following classes:

* `monopoly.rb` - Entry point, handles CLI interaction and starts the game
* `board.rb` - Loads and manages the game board
* `space.rb` - Base class representing a generic board space
* `property.rb` - Inherits from `Space`, represents purchasable properties
* `player.rb` - Represents each player, including money, position, owned properties and methods to move, buy properties or pay rent

### Design Notes

* **Inheritance** is used to model board spaces:

  * `Property < Space`
* This allows easy extension for additional space types (e.g. Chance, Jail, Tax spaces) where shared behaviour is abstracted into Space
* Responsibilities are clearly separated to keep logic maintainable and testable

---

## Game Rules

* Each player starts with **$16**
* All players begin on **GO**
* Passing GO earns **$1** (excluding the starting move)
* Landing on a property:

  * If unowned → must purchase
  * If owned → must pay rent
* Rent:

  * Equal to property price
  * Doubled if the owner holds all properties of the same colour
* The board wraps around
* The game ends immediately when a player becomes bankrupt (money < $0)
* The player with the most money at the end wins

---

## Input Files

### `board.json`

Defines the game board.

Example structure:

```json
[
  { "name": "GO", "type": "go" },
  {
    "name": "The Burvale",
    "price": 1,
    "colour": "Brown",
    "type": "property"
  }
]
```

### `rolls_X.json`

A JSON array of dice rolls:

```json
[1, 3, 1, 1, 1, 2, 4, 2]
```

---

## Testing

Recommended approach:

* Unit tests for:

  * Player movement
  * Rent calculation
  * Property ownership
* Integration tests for:

  * Full game simulation with known dice rolls


---

## Extensibility

The current app design allows easy extension for:

* Chance cards, Jail or Tax spaces rules
* Property improvements: houses/hotels to increase rent
* Additional players or rule variations (auctions, trading/selling properties, etc.)


