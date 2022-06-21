var mapElement = document.getElementById("map");
if (mapElement != null) {
  var checkboxes = document.querySelectorAll(".category-checkboxes");
  var markers = document.querySelectorAll(".marker");
  var users = document.querySelectorAll(".user-list")

  function otherBoxesUnchecked(checkbox) {
    var answer = true;
    checkboxes.forEach((box) => {
      if (box.checked && box != checkbox) {
        answer = false;
      }
    });
    return answer;
  }

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("change", () => {
      var checkboxMarkers = document.querySelectorAll(`.marker.${checkbox.getAttribute("id")}`);
      var checkboxUsers = document.querySelectorAll(`.user-list.${checkbox.getAttribute("id")}`);
      if (otherBoxesUnchecked(checkbox)) {
        if(checkbox.checked){
        markers.forEach((card) => {card.classList.add("collapse")});
        users.forEach((card) => {card.classList.add("collapse")});
        checkboxMarkers.forEach((card) => {card.classList.remove("collapse")});
        checkboxUsers.forEach((card) => {card.classList.remove("collapse")});
        } else {
          markers.forEach((card) => {card.classList.remove("collapse")});
          users.forEach((card) => {card.classList.remove("collapse")});
        }
      } else {
        if(checkbox.checked){
          checkboxMarkers.forEach((card) => {card.classList.remove("collapse")});
          checkboxUsers.forEach((card) => {card.classList.remove("collapse")});
        } else {
          checkboxMarkers.forEach((card) => {card.classList.add("collapse")});
          checkboxUsers.forEach((card) => {card.classList.add("collapse")});
          checkboxes.forEach((checkbox) => {
          if(checkbox.checked) {
            var checkboxMarkers = document.querySelectorAll(`.marker.${checkbox.getAttribute("id")}`);
            var checkboxUsers = document.querySelectorAll(`.user-list.${checkbox.getAttribute("id")}`);
            checkboxMarkers.forEach((card) => {card.classList.remove("collapse")});
            checkboxUsers.forEach((card) => {card.classList.remove("collapse");
      })}})}}
    })
  })
}