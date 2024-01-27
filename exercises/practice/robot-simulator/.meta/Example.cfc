/**
* Here is an example solution for the RobotSimulator exercise
*/
component accessors="true" {

	property name="x" type="numeric";

	property name="y" type="numeric";

	property name="direction" type="string";

	allowed_directions = ['north', 'east', 'south', 'west'];


	function init( required x, required y, required direction ){
		variables.x = arguments.x;
		variables.y = arguments.y;
		variables.direction = arguments.direction;

		return this;
    }

	function move( commands ){
		for (var i = 1; i <= len(commands); i++) {
			var command = mid(commands, i, 1);
			if (command == "L") {
				var j = arrayFind(allowed_directions, direction);
				j = (j + 2) % arrayLen(allowed_directions) + 1;
				direction = allowed_directions[j];
			} else if (command == "R") {
				var j = arrayFind(allowed_directions, direction);
				j = j % arrayLen(allowed_directions) + 1;
				direction = allowed_directions[j];
			} else if (command == "A") {
				if (direction == 'north'){
					y += 1;
				} else if (direction == 'east'){
					x += 1;
				} else if (direction == 'south'){
					y -= 1;
				} else if (direction == 'west'){
					x -= 1;
				}
			}
		}
	}

}