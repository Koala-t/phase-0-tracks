// method to return the longest word from an array of strings

// Declare method and let it take an array as an argument
function findLongestWord(words) {
	//make a variable to hold the longest word and assign it to an empty string
	var longestWord = '';
	// iterate through the input array
	for(var i = 0; i < words.length; i++) {
		// if the current word is longer than the 'longest word'
		if(words[i].length > longestWord.length) {
			// reassign the longest word to the current word
			longestWord = words[i];	
		};
	};
	// return the longest word
	return longestWord;
};


// method to look for matching key-value pairs in different objects

// declare a method that takes two objects as arguments
function matchingElements(obj1, obj2) {
	// iterate through one of the objects (obj1)
	for(key in obj1) {
		// iterate through the other object (obj2)
		for(match in obj2) {
			// if the current key-value pair in obj1 matches the current key-value pair in obj2
			if (key == match && obj1[key] == obj2[match]) {
				// return true
				return true;
			};	
		};
	};
	// if none of the keys and values matched return false
	return false;
};


// method for generating random words in an array with the length of the array determined by the input

// declare a method that takes a number as an argument
	// make an alphabet-variable
	// make an array-variable
	// iterate the input number of times
		// make a word-variable
		// determine the word-length randomly (1-10 letters)
		// iterate word-length number of times
			// chose a letter at random from the alphabet
			// add that letter to the word-variable
		// add the word-variable to the array-variable
	// return the array-variable





// driver code

// findLongestWord tests
console.log('=====findLongestWord-test=====');
// declare an array and assign it to a variable
var testArray1 = ["word", "longerWord", "longestWord"];
var testArray2 = ["Avacado", "lime", "orange"];
var testArray3 = ["dog", "cat", "rhino"];
var testArrays = [testArray1, testArray2, testArray3];
// invoke the longest-word-method and log the result
for(var i = 0; i < testArrays.length; i++) {
	console.log(findLongestWord(testArrays[i]));
};

// matchingElements test
console.log('=====matchingElements-test=====');
var testObject1 = {hat: 'red', shirt: 'blue', pants: 'brown'};
var testObject2 = {hat: 'green', shirt: 'orange', pants: 'brown'};
var testObject3 = {cat: 'orange', dog: 'brown', snake: 'green'};
console.log(matchingElements(testObject1, testObject2))
console.log(matchingElements(testObject1, testObject3))

