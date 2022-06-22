const canvatennis = document.getElementById("tennisChart").getContext("2d");

const rankPerf = document.getElementById("rank-perf").childNodes;
var arrayrank = [];
var newArrayrank = [];
getData(arrayrank, rankPerf, getLength(rankPerf), 2, newArrayrank);

var newArrayrank1 = [];
newArrayrank[0].forEach((element) => {
	newArrayrank1.push(element.replace("/", "."));
});

const datetennis = document.getElementById("date-perf-tennis").childNodes;
var arrayDatetennis = [];
var newArrayDatetennis = [];
getData(
	arrayDatetennis,
	datetennis,
	getLength(datetennis),
	2,
	newArrayDatetennis
);

const myChartTennis = new Chart(canvatennis, {
	type: "line",
	data: {
		labels: newArrayDatetennis[0],
		datasets: [
			{
				barThickness: 70,
				label: "EVOLUTION DE TON RANG",
				data: newArrayrank1,
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
