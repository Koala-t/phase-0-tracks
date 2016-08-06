var colors = ['blue', 'red', 'green', 'yellow'];

var horses = ['Edd', 'Princess', 'Dagger', 'Silver'];

// add a color to colors
colors.push('sparkly');
// add a name to horses
horses.push('Teddy');


// make an object made of horses of different colors

// make a new object
// populate the object with horses
// assign those horses colors

// create object
var stable = {};
// iterate through the arrays
for(var i = 0; i < horses.length; i++) {
	// assign current array-values to the object as a key and value 
	stable[horses[i]] = colors[i];
};

