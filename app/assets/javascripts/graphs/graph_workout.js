const canvaworkout = document.getElementById("workoutChart").getContext("2d");

const benchpressPerf = document.getElementById("benchpress-perf").childNodes;
var arraybenchpress = [];
var newArraybenchpress = [];
getData(
	arraybenchpress,
	benchpressPerf,
	getLength(benchpressPerf),
	2,
	newArraybenchpress
);

const squatPerf = document.getElementById("squat-perf").childNodes;
var arraysquat = [];
var newArraysquat = [];
getData(arraysquat, squatPerf, getLength(squatPerf), 2, newArraysquat);

const dateworkout = document.getElementById("date-perf-workout").childNodes;
var arrayDateworkout = [];
var newArrayDateworkout = [];
getData(
	arrayDateworkout,
	dateworkout,
	getLength(dateworkout),
	2,
	newArrayDateworkout
);

const myChartworkout = new Chart(canvaworkout, {
	type: "line",
	data: {
		labels: newArrayDateworkout[0],
		datasets: [
			{
				barThickness: 70,
				label: "EVOLUTION DE TON POIDS EN BENCHPRESS (kg)",
				data: newArraybenchpress[0],
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
				label: "EVOLUTION DE TON POIDS EN SQUATS (kg)",
				data: newArraysquat[0],
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
