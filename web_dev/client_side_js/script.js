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