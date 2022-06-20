links= document.querySelectorAll(".new-conversation");
links.forEach(function (item) {
    item.addEventListener('click', function () {
        document.getElementById("form-message").innerHTML = "";
document.getElementById("form-message").insertAdjacentHTML("beforeend", "<%= j render 'form', {message: @new_message, recipient: @message.sender}%>");
    });
});
