window.onload = function () {
	var city = document.getElementById("city-name");
	var temp = document.querySelector(".temp");
	var hum = document.querySelector(".hum");
	var cloud = document.querySelector(".clouds");
	var wind = document.querySelector(".wind");
	var img = document.querySelector(".temp-img");
	if (temp != null) {
		fetch(
			"https://api.openweathermap.org/data/2.5/weather?q=" +
				city.innerHTML +
				"&units=metric&appid=b70377fc39863e8b80922c33f06fb98c"
		)
			.then((response) => response.json())
			.then((data) => {
				var tempValue = data["main"]["temp"];
				var humValue = data["main"]["humidity"];
				var cloudValue = data["clouds"]["all"];
				var windValue = data["wind"]["speed"];
				var badWeather =
					"<img src='https://free3dicon.com/wp-content/uploads/2022/01/rain_perspective_matte_s-300x300.png'> </img>";
				var cloudWeather =
					"<img src='https://free3dicon.com/wp-content/uploads/2021/03/cloud_perspective_matte_s-1-300x300.png'> </img>";
				var sunWeather =
					"<img src='https://free3dicon.com/wp-content/uploads/2021/09/sun_perspective_matte_s-2-300x300.png'> </img>";
				var suncloudWeather =
					"</img> <img src='https://free3dicon.com/wp-content/uploads/2021/09/sun_perspective_matte_s-2-300x300.png'> </img> <img src='https://free3dicon.com/wp-content/uploads/2021/03/cloud_perspective_matte_s-1-300x300.png'> ";
				temp.innerHTML = tempValue;
				hum.innerHTML = humValue;
				cloud.innerHTML = cloudValue;
				wind.innerHTML = windValue;

				if (tempValue < 10) {
					img.innerHTML = badWeather;
				} else if (tempValue > 10 && tempValue < 15) {
					img.innerHTML = cloudWeather;
				} else if (tempValue > 15 && tempValue < 20) {
					img.innerHTML = suncloudWeather;
				} else {
					img.innerHTML = sunWeather;
				}
			})
			.catch((err) => alert("erreur"));
	}
};
