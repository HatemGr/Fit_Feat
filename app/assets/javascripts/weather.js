// window.onload = function () {
// 	var city = document.getElementById("city-name");
// 	var temp = document.querySelector(".temp");
// 	var hum = document.querySelector(".hum");
// 	var cloud = document.querySelector(".clouds");

// 	fetch(
// 		"https://api.openweathermap.org/data/2.5/weather?q=" +
// 			city.innerHTML +
// 			"&units=metric&appid=b70377fc39863e8b80922c33f06fb98c"
// 	)
// 		.then((response) => response.json())
// 		.then((data) => {
// 			console.log(data);
// 			var tempValue = data["main"]["temp"];
// 			var humValue = data["main"]["humidity"];
// 			var cloudValue = data["clouds"]["all"];

// 			temp.innerHTML = tempValue;
// 			hum.innerHTML = humValue;
// 			cloud.innerHTML = cloudValue;
// 		});
// 	// .catch((err) => alert("erreur"));
// };
