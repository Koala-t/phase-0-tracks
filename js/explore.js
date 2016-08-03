// method to reverse a string
// declare method
function reverse(string) {
	newString = "";
	// iterate backwards through the string
	for(var i = string.length - 1; i >= 0; i--) {
		// build a new string letter-by-letter
		newString = newString + string[i];
	}
	// return the new string
	return newString;
}

// driver code
console.log(reverse('hello'));