let modalpop = document.getElementById("modalId");

if (modalpop != null) {
	let modalpop2 = document.getElementById("modalId2");
	let modalpop3 = document.getElementById("modalId3");
	let darkLayer = document.getElementById("layer-dark");

	function closeModal() {
		modalpop.style.display = "none";
		modalpop2.style.display = "block";
	}

	function closeModal2() {
		modalpop2.style.display = "none";
		modalpop3.style.display = "block";
	}

	function closeModal3() {
		modalpop3.style.display = "none";
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
