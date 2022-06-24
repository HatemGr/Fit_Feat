let modalpop = document.getElementById("modalId");

if (modalpop != null) {
	let darkLayer = document.getElementById("layer-dark");

	function closeModal() {
		modalpop.style.display = "none";
		darkLayer.style.display = "none";
	}

	function openModal() {
		darkLayer.style.display = "block";
		modalpop.style.display = "block";
	}

	function setLocalStorage() {
		if (localStorage.getItem("firstSession?") === null) {
			openModal();
			localStorage.setItem("firstSession?", true);
		}
	}

	setTimeout(() => {
		let userId = document.getElementById("id-user-local").textContent.trim();
		let urlStorageLocal = `http://localhost:3000/users/${userId}/edit`;
		let urlStorageHeroku = `https://fit-feat.herokuapp.com/users/${userId}/edit`;
		if (
			window.location.href == urlStorageLocal ||
			window.location.href == urlStorageHeroku
		) {
			setLocalStorage();
		}
	}, "800");
}
