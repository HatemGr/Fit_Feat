window.onload = function () {
	var avatarButton = document.getElementById("label-avatar");
	var majButton = document.getElementById("submit-avatar");

	avatarButton.addEventListener("click", function () {
		setTimeout(() => {
			avatarButton.style.display = "none";
			majButton.style.display = "block";
		}, "1000");
	});
};
