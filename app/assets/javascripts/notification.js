window.onload = function () {
	var notifCard = document.getElementById("notif-card");
	var arrowBtn = document.getElementById("arrow-btn");

	arrowBtn.addEventListener("click", function () {
		notifCard.classList.toggle("notif-collapse");
		arrowBtn.classList.toggle("reverse-arrow");
	});
};
