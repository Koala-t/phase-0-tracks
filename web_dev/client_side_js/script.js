// set the title
var title = document.getElementsByTagName('title')[0];
title.innerHTML = 'test page';


// make a div
var element = document.createElement('div');
// add it to the body
var body = document.getElementById('main');
body.appendChild(element);


// give the new div some style
element.style.width = '500px';
element.style.height = '300px';
element.style.border = '10px solid purple';
element.style.backgroundColor = 'blue';


// make 3 more divs
for(var i = 0; i < 3; i++) {
	var newDiv = document.createElement('div');
	newDiv.className = 'set';
	body.appendChild(newDiv);
};

// change the style on all the 'set' divs
set = document.getElementsByClassName('set');

var stylize = function(el) {
	el.style.width = '200px';
	el.style.height = '100px';
	el.style.border = '15px dotted red';
	el.style.backgroundColor = 'orange';
};

for(var i = 0; i < set.length; i++) {
	stylize(set[i]);
};


// make changes on click
var response = function () {
	var color = element.style.backgroundColor;
	if (color == 'blue') {
		element.style.backgroundColor = 'black';
	} else {
		element.style.backgroundColor = 'blue';
	}
};
element.addEventListener("click", response);





