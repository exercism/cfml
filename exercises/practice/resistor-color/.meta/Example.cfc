/**
* Here is an example solution for the ResistorColor exercise
*/
component {
    
    COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

    function colorCode( color ) {
        return ArrayFind(COLORS, color) - 1;
    }

    function colors() {
        return COLORS;
    }

}