function openPerf(e, perf) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	test = document.getElementsByClassName("test")[0];

	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
		tablinks[0].classList.remove("test");
	}

	document.getElementById(perf).style.display = "block";
	e.currentTarget.className += " active";
}

window.addEventListener("load", function () {
	document.getElementById("defaultOpen").click();
});
