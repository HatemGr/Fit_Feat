const canvaClimbing = document.getElementById("climbingChart").getContext("2d");

const levelPerf = document.getElementById("level-perf").childNodes;
var arrayLevel = [];
var newArrayLevel = [];
getData(arrayLevel, levelPerf, getLength(levelPerf), 2, newArrayLevel);

const dateClimbing = document.getElementById("date-perf-climbing").childNodes;
var arrayDateClimbing = [];
var newArrayDateClimbing = [];
getData(
	arrayDateClimbing,
	dateClimbing,
	getLength(dateClimbing),
	2,
	newArrayDateClimbing
);

const myChart = new Chart(canvaClimbing, {
	type: "line",
	data: {
		labels: newArrayDateClimbing[0],
		datasets: [
			{
				barThickness: 70,
				label: "EVOLUTION DE TON NIVEAU",
				data: newArrayLevel[0],
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
