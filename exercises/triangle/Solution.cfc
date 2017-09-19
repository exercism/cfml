/**
* Here is an example solution for the Triangle exercise
*/
component {
	
	function equilateral( array sides ) {
		// Is triangle and all 3 sides the same
		return isTriangle( sides ) && countSides( sides ) == 1;
	}
	
	function isosceles( array sides ) {
		// Is triangle and at least two sides the same
		return isTriangle( sides ) && countSides( sides ) < 3;
	}
	
	function scalene( array sides ) {
		// Is triangle and all 3 sides different
		return isTriangle( sides ) && countSides( sides ) == 3;
	}
	
	private function countSides( array sides ) {
		var distinctSides = {};
				
		// Keep track of distinct sides
		sides.each( function( side ){
			distinctSides[ side ] = true;
		} );
		
		// Count 'em up
		return distinctSides.count();
	}
	
	private function isTriangle( array sides ) {
		// Any sides of 0 are invalid
		if( sides[ 1 ] == 0 || sides[ 2 ] == 0 || sides[ 3 ] == 0 ) {
			return false;
		}
		// sides 1 and 2 must be at least the size of side 3
		if( sides[ 1 ] + sides[ 2 ] < sides[ 3 ] ) {
			return false;
		}
		// sides 1 and 3 must be at least the size of side 2
		if( sides[ 1 ] + sides[ 3 ] < sides[ 2 ] ) {
			return false;
		}
		// sides 2 and 3 must be at least the size of side 1
		if( sides[ 2 ] + sides[ 3 ] < sides[ 1 ] ) {
			return false;
		}
		// If we made it here, it's a triangle!
		return true;
	}
}