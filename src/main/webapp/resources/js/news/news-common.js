let newsCurrUrl =  window.location.href;

console.log("news-common --------> " +newsCurrUrl)
let changeNavbarSearchNews = function(text) {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="javascript:history.back()" id="not-selected">< 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| " + text
    +"</span"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
if(newsCurrUrl.includes('register')){
    changeNavbarSearchNews('새 소식 등록')
}
if(newsCurrUrl.includes('modify')){
    changeNavbarSearchNews('새 소식 수정')
}
if(newsCurrUrl.includes('list')){
    changeNavbarSearchNews('새 소식')
}
// if(newsCurrUrl.contains('get')){}

let changeSelectedMenu = function(){

    let selectedMenu = document.querySelector('.navbar-menu-center-menuLink.selected');
    let newsMenu = document.querySelector('.navbar-menu-center a[href="/news/list"]');

    selectedMenu.setAttribute('class', 'navbar-menu-center-menuLink');
    newsMenu.setAttribute('class', 'navbar-menu-center-menuLink selected');
}

changeSelectedMenu();