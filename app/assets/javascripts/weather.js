window.onload = function () {
	var temp = document.querySelector(".temp");
	if (temp != null) {
		var city = document.getElementById("city-name");
		var hum = document.querySelector(".hum");
		var cloud = document.querySelector(".clouds");
		var wind = document.querySelector(".wind");
		var img = document.querySelector(".temp-img");
		var apiKey = "b70377fc39863e8b80922c33f06fb98c";
		var url = `https://api.openweathermap.org/data/2.5/weather?q=${city.textContent.trim()}&units=metric&appid=${apiKey}`
		console.log(url);
		fetch(url)
			.then((response) => response.json())
			.then((data) => {
				console.log({data});
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
			.catch((err) => console.error(err));
	}
};
