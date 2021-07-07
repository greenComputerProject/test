let changeNavbarSearch = function() {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="javascript:history.back()" id="not-selected" onclick="clickSearch(this)">< 돌아가기 </a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 실시간 채팅"
    +"</span"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
changeNavbarSearch();

let navbarSearch = document.querySelector('.navbar-search');
    console.log(navbarSearch);
    navbarSearch.style.background = 'white';