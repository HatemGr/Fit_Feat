const canvarunning = document.getElementById("runningChart").getContext("2d");

const speedPerf = document.getElementById("speed-perf").childNodes;
var arrayspeed = [];
var newArrayspeed = [];
getData(arrayspeed, speedPerf, getLength(speedPerf), 2, newArrayspeed);

const distancePerf = document.getElementById("distance-perf").childNodes;
var arraydistance = [];
var newArraydistance = [];
getData(
	arraydistance,
	distancePerf,
	getLength(distancePerf),
	2,
	newArraydistance
);

const daterunning = document.getElementById("date-perf-running").childNodes;
var arrayDaterunning = [];
var newArrayDaterunning = [];
getData(
	arrayDaterunning,
	daterunning,
	getLength(daterunning),
	2,
	newArrayDaterunning
);

const myChartRunning = new Chart(canvarunning, {
	type: "line",
	data: {
		labels: newArrayDaterunning[0],
		datasets: [
			{
				barThickness: 70,
				label: "EVOLUTION DE TA VITESSE MOYENNE (km/h)",
				data: newArrayspeed[0],
				borderColor: [
					"rgba(255, 99, 132, 1)",
					"rgba(54, 162, 235, 1)",
					"rgba(255, 206, 86, 1)",
					"rgba(75, 192, 192, 1)",
					"rgba(153, 102, 255, 1)",
					"rgba(255, 159, 64, 1)",
				],
				borderWidth: 1,
			},
			{
				barThickness: 70,
				label: "EVOLUTION DE TA DISTANCE MOYENNE (km)",
				data: newArraydistance[0],
				borderColor: [
					"rgba(255, 99, 132, 1)",
					"rgba(54, 162, 235, 1)",
					"rgba(255, 206, 86, 1)",
					"rgba(75, 192, 192, 1)",
					"rgba(153, 102, 255, 1)",
					"rgba(255, 159, 64, 1)",
				],
				borderWidth: 1,
			},
		],
	},
	options: {
		responsive: true,
		aspectRatio: 5,
		maintainAspectRatio: true,
	},
});
