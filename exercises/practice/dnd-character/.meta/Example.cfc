/**
* Here is an example solution for the Dnd Character exercise
*/
component {

    // simple implementation has disadvantage of breaking encapsulation
	this.strength = ability();
	this.dexterity = ability();
	this.constitution = ability();
	this.intelligence = ability();
	this.wisdom = ability();
	this.charisma = ability();
	this.hitpoints = 10 + abilityModifier( this.constitution );
	
	function abilityModifier( score ) {
		return floor((score - 10) / 2)
	}
	
	function ability() {
		var rolls = [roll(), roll(), roll(), roll()];
		arraySort(rolls, 'numeric', 'desc');
		return rolls.slice(1, 3).sum();
	}
	
	private function roll() {
		return randRange(1, 6);
	}

}