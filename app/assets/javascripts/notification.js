function openNotif() {
	var arrowBtn = document.getElementById("arrow-btn");
	var notifCard = document.getElementById("notif-card");

	notifCard.classList.toggle("notif-collapse");
	arrowBtn.classList.toggle("reverse-arrow");
}
