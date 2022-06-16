function openPerf(e, perf) {
	var i, tabcontent, tablinks;

	tabcontent = document.querySelectorAll(".tabcontent");
	firstTab = document.getElementsByClassName("first-tab")[0];

	tabcontent.forEach( tab => {
		tab.style.display = "none";
		tab.classList.remove("tab-active");
	})

	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
		tablinks[0].classList.remove("first-tab");
	}

	div = document.getElementById(perf);
	div.style.display = "block";
	div.classList.add("tab-active");
	e.currentTarget.className += " active";
}