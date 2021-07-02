let slideImages = document.getElementsByClassName("slide-image");
let slideDots = document.querySelectorAll(".game-slide-dots ul")[0];

let slideDotsInner ="<li id='prev-dot' class='side-dot' onclick='clickSlideDot(this)'><div>&#10094;</div></li>";

for(i=0; i< slideImages.length ; i++){
    if(i===0){
        slideDotsInner +="<li id="+ (i+1) + " class='dot selected' onclick='clickSlideDot(this)'></li>";
    } else {
        slideDotsInner +="<li id="+ (i+1) + " class='dot' onclick='clickSlideDot(this)'></li>";
    }
}
slideDotsInner += "<li id='next-dot' class='side-dot' onclick='clickSlideDot(this)'><div>&#10095;</div></li>";
slideDots.innerHTML = slideDotsInner;

let clickSlideDot = function(dot){
    slideImages = document.getElementsByClassName("slide-image");
    let id = dot.id;
    let activeImage = document.getElementsByClassName("slide-image active")[0];
    let selected = document.getElementsByClassName("dot selected")[0];
    if(id !== "prev-dot" && id !== "next-dot"){
        console.log(id)
        
        if(id !== selected.id){
            selected.setAttribute("class", "dot");
            dot.setAttribute("class", "dot selected");
    
            activeImage.setAttribute("class", "slide-image");
    
            slideImages[id-1].setAttribute("class" , "slide-image active");
            slideFadeInAndOut(activeImage, slideImages[id-1]);
        } 
    } else {
        //dot 의 id값에 해당하는 이미지의 숫자
        let activeImageNumber = getActiveImageNumber(slideImages, activeImage);
        let first = 1;
        let last = slideImages.length;
        let currentDotId = parseInt(selected.id);
        
        if(id === "next-dot"){
            
            if(activeImageNumber === last){
                let firstImage = slideImages[0];
                let lastDot = document.getElementsByClassName("dot selected")[0];
                let firstDot = document.getElementsByClassName("dot")[0];
                activeImage.setAttribute("class", "slide-image");
                firstImage.setAttribute("class", "slide-image active");
                slideFadeInAndOut(activeImage, firstImage);
                lastDot.setAttribute("class", "dot")
                firstDot.setAttribute("class", "dot selected");
                
            } else {
                let nextDotId = '\\' + 3 + ++currentDotId;
                let nextDot = document.querySelectorAll(".dot#" + nextDotId )[0];
                activeImage.setAttribute("class", "slide-image");
                slideImages[activeImageNumber].setAttribute("class", "slide-image active");
                slideFadeInAndOut(activeImage,slideImages[activeImageNumber]);
                selected.setAttribute("class", "dot");
                nextDot.setAttribute("class", "dot selected");
            }

        }
        if(id === "prev-dot"){
            if(activeImageNumber === first){
                let lastImage = slideImages[slideImages.length -1];
                activeImage.setAttribute("class", "slide-image");
                lastImage.setAttribute("class", "slide-image active");
                slideFadeInAndOut(activeImage, lastImage);
                let firstDot = document.getElementsByClassName("dot selected")[0];
                let dotList = document.getElementsByClassName("dot");
                let lastDot = dotList[dotList.length-1];
                lastDot.setAttribute("class", "dot selected")
                firstDot.setAttribute("class", "dot");
            }else {
                let prevDotId = '\\' + 3 + --currentDotId;
                let prevDot = document.querySelectorAll(".dot#" + prevDotId )[0];
                activeImage.setAttribute("class", "slide-image");
                slideImages[activeImageNumber-2].setAttribute("class", "slide-image active");
                slideFadeInAndOut(activeImage, slideImages[activeImageNumber-2]);
                selected.setAttribute("class", "dot");
                prevDot.setAttribute("class", "dot selected");
            }
        }
    }
}

let getActiveImageNumber = function(slideImages, activeImage){

    for(i=0 ; i<slideImages.length ; i++){
        if(slideImages[i] == activeImage){
            return i+1;
        }
    }
    
    return null;
    
}

let slideFadeInAndOut = function(activeImage, image) {
    activeImage.animate([
        {
            opacity: 1
        },{
            opacity: 0.5
        }
    ], 500);
    
    image.animate([
        {
            opacity: 0.5
        },{
            opacity: 1
        }
    ], 500);
}



// star rating animation

let drawStars = function(star) {
    let starNumber = star.id.length;
    let stars = document.getElementsByClassName("fa-star");
    for(i=0 ;i<starNumber ; i++){
        stars[i].setAttribute("class", "fa fa-star fa-2x checked");
    }
    for(i=starNumber ; i < stars.length ; i++  ){
        stars[i].setAttribute("class", "fa fa-star fa-2x");
    }
}

let hoverStar = function(star) {
    drawStars(star);
    
}

let clickStar = function(star) {
    drawStars(star);
    let starNumber = star.id.length;
    let myRating = document.querySelectorAll(".my-rating span")[0];

     myRating.innerHTML = starNumber;
    myRating.animate(
        [{
            border: "2px solid rgb(120, 120, 204)"
        },{
            border: "1px solid blue"
        }], 30000);
};