const menu = document.querySelector(".menu");
const menuItems = Array.from(menu.querySelectorAll("a"));

function visible(textColor, iconColor) {
	for (let i = 0; i < menuItems.length; i++) {
		if (menuItems[i].ariaSelected) {
			for (let i = 0; i < menuItems.length; i++) {
				menuItems[i].style.color = textColor;
				menuItems[i].firstChild.nextElementSibling.style.color = "black";
			}
			menuItems[i].style.color = iconColor;
			menuItems[i].firstChild.nextElementSibling.style.color =
				"rgb(var(--purple))";
		} else {
			menuItems[i].style.color = textColor;
			menuItems[i].firstChild.nextElementSibling.style.color = "black";
		}
	}
}

const mediaQuery = "(min-width: 800px)";

window.matchMedia(mediaQuery).addEventListener("change", (e) => {
	if (e.matches) {
		visible("black", "rgb(var(--purple))");
	} else {
		visible("transparent", "transparent");
	}
});

if (window.matchMedia("(min-width: 800px)").matches) {
	visible("black", "rgb(var(--purple))");
} else {
	visible("transparent", "transparent");
}
