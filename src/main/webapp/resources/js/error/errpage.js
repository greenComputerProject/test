let changeNavbarSearchError = function(text) {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="javascript:history.back()" id="not-selected">< 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 에러페이지" 
    +"</span>"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}

changeNavbarSearchError();