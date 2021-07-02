let flag = false;

let imageLotateAnimation = function(image){
    
    image.animate(
        [{
            transform : "rotate(0deg)"
        },{
            transform : "rotate(180deg)"
        }], 200
    )
}
let imageLotateAnimationReverse = function(image){
    
    image.animate(
        [{
            transform : "rotate(180deg)"
        },{
            transform : "rotate(0deg)"
        }], 200
    )
}

let clickOrderTitle = function(){
    flag = !flag;
    let order = document.querySelectorAll(".order-form .title")[0];
    let fontAwesome = order.getElementsByTagName("i")[0];
    let dropdown = document.querySelectorAll(".order-form .list")[0];

    if(flag){
        order.style.border = "";
        dropdown.style.display = "block";
        imageLotateAnimation(fontAwesome);
        fontAwesome.setAttribute("id", "selected")
    } else {
        order.style.border = "1px solid rgb(121, 121, 121)";
        dropdown.style.display = "none";
        imageLotateAnimationReverse(fontAwesome);
        fontAwesome.setAttribute("id", "");
    }
    
}
let clickOrderButton = function(button){
    console.log(button.textContent)
    clickOrderTitle();
    let orderDisplay = document.querySelectorAll(".order-form .title span")[0];
    console.log(orderDisplay);
    orderDisplay.textContent = button.textContent;
}