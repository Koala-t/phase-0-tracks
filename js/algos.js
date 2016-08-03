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


// driver code
// declare an array and assign it to a variable
var testArray = ["word", "longestWord", "longWord"]
// invoke the longest-word-method and log the result
console.log(findLongestWord(testArray))	