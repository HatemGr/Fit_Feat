let modalpop = document.getElementById("modalId");
console.log(modalpop);

if (modalpop != null) {
	let darkLayer = document.getElementById("layer-dark");
	console.log(darkLayer);

	function closeModal() {
		modalpop.style.display = "none";
		darkLayer.style.display = "none";
	}

	function openModal() {
		console.log("open modal");
		darkLayer.style.display = "block";
		modalpop.style.display = "block";
	}

	function setLocalStorage() {
		if (localStorage.getItem("firstSession?") === null) {
			console.log("null ou pas null");
			openModal();
			localStorage.setItem("firstSession?", true);
		}
	}

	setTimeout(() => {
		let userId = document.getElementById("id-user-local").textContent.trim();
		let urlStorage = `http://localhost:3000/users/${userId}/edit`;

		console.log(userId);
		console.log(urlStorage);

		if (window.location.href == urlStorage) {
			console.log("ca va jusque ici");
			setLocalStorage();
			console.log("là non");
		}
	}, "800");
}
