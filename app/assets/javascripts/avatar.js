function downloadPhoto() {
	var avatarButton = document.getElementById("label-avatar");
	var majButton = document.getElementById("submit-avatar");

	setTimeout(() => {
		avatarButton.style.display = "none";
		majButton.style.display = "block";
	}, "1000");
}
