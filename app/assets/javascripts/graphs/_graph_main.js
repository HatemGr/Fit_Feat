function getData(array, childNodes, arrayLenght, numberIteration, newArray) {
	for (var i = 1; i < arrayLenght; i += numberIteration) {
		array.push(childNodes[i].innerHTML);
	}
	return newArray.push(Object.values(array));
}

var getLength = function (childNodes) {
	return Math.ceil(childNodes.length);
};
