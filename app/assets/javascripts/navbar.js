// const menu = document.querySelector(".menu");

// const menuItems = Array.from(menu.querySelectorAll("a"));

// console.log(menuItems);

// for (let i = 0; i < menuItems.length; i++) {
// 	if (menuItems[i].ariaSelected == true) {
// 		menuItems[i].style.color = "transparent";
// 		menuItems[i].firstChild.nextElementSibling.style.color =
// 			"rgb(var(--purple))";
// 	} else {
// 		menuItems[i].style.color = "transparent";
// 		menuItems[i].firstChild.nextElementSibling.style.color = "black";
// 	}
// }

// let activeItem = menu.querySelector("[aria-selected]");
// const indicator = document.createElement("span");

// indicator.classList.add("indicator");
// menu.appendChild(indicator);
// console.log(getTransform(activeItem));
// if (activeItem) {
// 	indicator.style.setProperty("transform", getTransform(activeItem));
// }

// /**
//  *
//  * @param {{currentTarget: HTMLElement}} e
//  */

// function onItemClick(e) {
// 	if (e.currentTarget === activeItem) {
// 		return;
// 	}

// 	activeItem?.removeAttribute("aria-selected");
// 	activeItem?.removeAttribute("style");

// 	e.currentTarget.setAttribute(
// 		"style",
// 		"background-color: rgba(var(--purple), 0.05)"
// 	);
// 	e.currentTarget.setAttribute("aria-selected", "true");
// 	indicator.animate([{ transform: getTransform(e.currentTarget) }], {
// 		fill: "both",
// 		duration: 600,
// 		easing: "cubic-bezier(.48, 1.55, .28,1)",
// 	});
// 	activeItem = e.currentTarget;
// }

// /**
//  *
//  * @param {HTMLElement} element
//  * @return {string}
//  */
// function getTransform(element) {
// 	const transform = {
// 		y: element.offsetTop,
// 		scaleY: element.offsetHeight / 100,
// 	};
// 	return `translateY(${transform.y}px) scaleY(${transform.scaleY})`;
// }

// menuItems.forEach((item) => {
// 	item.addEventListener("click", onItemClick);
// });
