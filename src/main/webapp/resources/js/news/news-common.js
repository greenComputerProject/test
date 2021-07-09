let newsCurrUrl =  window.location.href;

console.log("news-common --------> " +newsCurrUrl)
let changeNavbarSearchNews = function(text) {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="/" id="not-selected">< 메인으로 가기</a>'
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
if(newsCurrUrl.includes('get')){
    
	let navbarSearch = document.querySelector('.navbar-search');
    console.log(navbarSearch);
    navbarSearch.style.background =  'linear-gradient(to right, rgb(230, 240, 240), rgb(250 , 240, 240))';
	changeNavbarSearchNews('새 소식');
}

let changeSelectedMenu = function(){

    let selectedMenu = document.querySelector('.navbar-menu-center-menuLink.selected');
    let newsMenu = document.querySelector('.navbar-menu-center a[href="/news/list?page=1"]');

    selectedMenu.setAttribute('class', 'navbar-menu-center-menuLink');
    newsMenu.setAttribute('class', 'navbar-menu-center-menuLink selected');
}

changeSelectedMenu();