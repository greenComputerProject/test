


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

let changeNavbarSearch = function() {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="/" id="not-selected" onclick="clickSearch(this)">< 메인으로 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 게임 등록"
    +"</span>"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
changeNavbarSearch();