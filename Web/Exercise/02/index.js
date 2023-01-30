let body = document.getElementsByTagName("body")[0];
const hours = document.getElementById("hr");
const minutes = document.getElementById("min");
const seconds = document.getElementById("sec");

const displayDate = () => {
    let now = new Date();
    let hr = now.getHours();
    let min = now.getMinutes();
    let sec = now.getSeconds();
    if (hr < 10) {
        hr = "0" + hr;
    }
    if (min < 10) {
        min = "0" + min;
    }
    if (sec < 10) {
        sec = "0" + sec;
    }
    hours.firstElementChild.innerHTML = hr;
    minutes.firstElementChild.innerHTML = min;
    seconds.firstElementChild.innerHTML = sec;
}

setInterval(displayDate, 1000);

function toggleBackground() {
    body.classList.toggle("background")
}