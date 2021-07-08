let changeNavbarSearchSupport = function(text) {
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

changeNavbarSearchSupport('고객 문의')


let changeSelectedMenu = function(){

    let selectedMenu = document.querySelector('.navbar-menu-center-menuLink.selected');
    let newsMenu = document.querySelector('.navbar-menu-center a[href="/support/list"]');

    selectedMenu.setAttribute('class', 'navbar-menu-center-menuLink');
    newsMenu.setAttribute('class', 'navbar-menu-center-menuLink selected');
}

changeSelectedMenu();