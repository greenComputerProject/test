


let clickOption = function(event) {

    let inputTag  = document.querySelectorAll("#formGameTag input")[0];
    let addedTags = inputTag.getAttribute("value");
    let optionValue = event.target.value + " ";

    addedTags += optionValue;

    inputTag.setAttribute("value", addedTags);
}

let resetTag = function () {
    
    let inputTag  = document.querySelectorAll("#formGameTag input")[0];
    inputTag.setAttribute("value", "");
}

let changeNavbarSearch = function(text) {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="javascript:history.back();" id="not-selected" >< 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 게임 " + text
    +"</span>"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
let registerCurrUrl = window.location.href;

if(registerCurrUrl.includes('register')){
    changeNavbarSearch('등록');
}

if(registerCurrUrl.includes('modify')){
    changeNavbarSearch('수정');
}



let checkExistsGame = function(input){
    
    let title = input.value;

    $.ajax({
        type : 'GET',
        url: '/game/isExists/' + title,
        dataType: 'json',
        success: function(data){
            let isExists = document.querySelector(".existWarning");
            if(data == true){
                isExists.style.display = "block";
            } else {
            	isExists.style.display = "none";
            }
        }, error: function(error){
            return;
        }

    })
}


