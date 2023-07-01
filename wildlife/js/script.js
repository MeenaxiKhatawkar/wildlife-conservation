let login = document.querySelector(".main-form .login-form");

document.querySelector("#login-btn").onclick = () => {
    login.classList.toggle('active');
    navbar.classList.remove('active');
}
let subscribe = document.querySelector(".main-form .sub-form");

document.querySelector("#sub-btn").onclick = () => {
    subscribe.classList.toggle('active');
    navbar.classList.remove('active');
}

let navbar = document.querySelector(".header .navbar");

document.querySelector('#menu-btn').onclick = () => {
    login.classList.remove('active');
    navbar.classList.toggle('active');
}

window.onscroll = () => {
    login.classList.remove('active');
    navbar.classList.remove('active');
}


// animals project detail btn 
const modal = document.querySelector("#modal"),
    overlay = document.querySelector(".overlay"),
    showBtn = document.querySelector(".show-modal"),
    closeBtn = document.querySelector(".close-btn");
showBtn.addEventListener("click", () => modal.classList.add("active"));
overlay.addEventListener("click", () =>
    modal.classList.remove("active")
);
closeBtn.addEventListener("click", () =>
    modal.classList.remove("active")
);






// slider



const carousel = document.querySelector(".carousel"),
    firstImg = carousel.querySelectorAll("img")[0],
    arrowIcons = document.querySelectorAll(".wrapper i");

let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;

const showHideIcons = () => {
    // showing and hiding prev/next icon according to carousel scroll left value
    let scrollWidth = carousel.scrollWidth - carousel.clientWidth; // getting max scrollable width
    arrowIcons[0].style.display = carousel.scrollLeft == 0 ? "none" : "block";
    arrowIcons[1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
}

arrowIcons.forEach(icon => {
    icon.addEventListener("click", () => {
        let firstImgWidth = firstImg.clientWidth + 14; // getting first img width & adding 14 margin value
        // if clicked icon is left, reduce width value from the carousel scroll left else add to it
        carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
        setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
    });
});

const autoSlide = () => {
    // if there is no image left to scroll then return from here
    if (carousel.scrollLeft - (carousel.scrollWidth - carousel.clientWidth) > -1 || carousel.scrollLeft <= 0) return;

    positionDiff = Math.abs(positionDiff); // making positionDiff value to positive
    let firstImgWidth = firstImg.clientWidth + 14;
    // getting difference value that needs to add or reduce from carousel left to take middle img center
    let valDifference = firstImgWidth - positionDiff;

    if (carousel.scrollLeft > prevScrollLeft) { // if user is scrolling to the right
        return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
    }
    // if user is scrolling to the left
    carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
}

const dragStart = (e) => {
    // updatating global variables value on mouse down event
    isDragStart = true;
    prevPageX = e.pageX || e.touches[0].pageX;
    prevScrollLeft = carousel.scrollLeft;
}

const dragging = (e) => {
    // scrolling images/carousel to left according to mouse pointer
    if (!isDragStart) return;
    e.preventDefault();
    isDragging = true;
    carousel.classList.add("dragging");
    positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
    carousel.scrollLeft = prevScrollLeft - positionDiff;
    showHideIcons();
}

const dragStop = () => {
    isDragStart = false;
    carousel.classList.remove("dragging");

    if (!isDragging) return;
    isDragging = false;
    autoSlide();
}

carousel.addEventListener("mousedown", dragStart);
carousel.addEventListener("touchstart", dragStart);

document.addEventListener("mousemove", dragging);
carousel.addEventListener("touchmove", dragging);

document.addEventListener("mouseup", dragStop);
carousel.addEventListener("touchend", dragStop);




// // Get the popups
// var popup1 = document.getElementById('popup1');
// var popup2 = document.getElementById('popup2');
// var popup3 = document.getElementById('popup3');
// var popup4 = document.getElementById('popup4');

// // When the user clicks anywhere outside of the popup, close it
// window.onclick = function(event) {
//     if (event.target == popup1) {
//         popup1.style.display = "none";
//     }
//     if (event.target == popup2) {
//         popup2.style.display = "none";
//     }
//     if (event.target == popup3) {
//         popup3.style.display = "none";
//     }
//     if (event.target == popup4) {
//         popup4.style.display = "none";
//     }
// }