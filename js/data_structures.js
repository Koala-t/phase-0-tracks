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

// create a Car constructor function
	// give the car a couple of unique properties
	// give the car some functions: honk, brake, accelerate

function Car(doors, convertibleTop, color) {
	
	this.doors = doors;
	this.convertibleTop = convertibleTop;
	this.color = color; 
	this.position = 'here'; 

	this.honk = function() {console.log ("Beep, beep!")}; 
	this.brake = function() {console.log ("Screeech!")};
	this.accelerate = function() { this.position = 'over there'};
	this.findCar = function() {console.log ("Your car is "+ this.position + ".")}


}; 

var corvette = new Car(4, true, "red");
console.log(corvette);
corvette.honk();
corvette.brake();
corvette.findCar();
corvette.accelerate();
corvette.findCar();