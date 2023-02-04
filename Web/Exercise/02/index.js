const body = document.getElementsByTagName("body")[0];
const hours = document.getElementById("hr");
const minutes = document.getElementById("min");
const seconds = document.getElementById("sec");

const displayDate = () => {
    const now = new Date();
    const min = now.getMinutes();
    const hr = now.getHours();
    const sec = now.getSeconds();
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