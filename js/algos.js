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
var testArray1 = ["word", "longerWord", "longestWord"]
var testArray2 = ["Avacado", "lime", "orange"]
var testArray3 = ["dog", "cat", "rhino"]
var testArrays = [testArray1, testArray2, testArray3]
// invoke the longest-word-method and log the result
for(var i = 0; i < testArrays.length; i++) {
	console.log(findLongestWord(testArrays[i]))
}	