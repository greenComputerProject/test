
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

let deleteWishlist = function(wno){
    console.log("deleteWishlist");

    $.ajax({
        type: 'DELETE',
        url: '/wishlist/' + wno,
        dataType: 'json',
        success: function(result){
            alert("성공적으로 삭제되었습니다.")
            location.reload();
        },
        error: function(error){
            location.reload();
            alert(error);
        }
    })
}

let changeNavbar = function(){
    let url = decodeURIComponent(window.location.href);
    let text  = "";
    if(url.includes('wishlist')){
        text =  "위시리스트";
    } else if(url.includes('library')){
        text = "라이브러리"
    } else {
        alert('잘못된 요청입니다.')
    }

    let navbar = document.querySelector(".navbar-search");
    let html = '<ul class="navbar-search-links">'
    + '<li><a href="/" id="not-selected" onclick="clickSearch(this)"> < 메인으로 돌아가기 </a></li>'
    + '<li><p>| '+ text +'</p></li>'
    + '</ul>';

    navbar.innerHTML = html;
}

changeNavbar();