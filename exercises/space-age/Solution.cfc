/**
* Here is an example solution for the SpaceAge exercise
*/
component {

	 function age( planet, seconds ) {
	 	
	 	// Seconds in one Earth lunar year
		var baseSeconds = 31557600;
		
		// Relative factor for each planet compared to Earth
		var planets = {
			Earth : 1,
			Mercury : 0.2408467,
			Venus : 0.61519726,
			Mars : 1.8808158,
			Jupiter : 11.862615,
			Saturn : 29.447498,
			Uranus : 84.016846,
			Neptune : 164.79132
		};
		
		// age in seconds divded by planet's relative solar year, rounded to two decimals
		return numberFormat( seconds  / ( planets[ planet ] * baseSeconds ), '.00' );
		
	}
		
}