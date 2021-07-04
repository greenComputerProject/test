let clickSearch = function(link){
    let id = link.getAttribute("id");
    if(id === "selected"){
        return;
    }else {
        let selectedLink = document.querySelectorAll(".navbar-search-links #selected")[0];
        selectedLink.setAttribute("id", "not-selected");
        link.setAttribute("id", "selected"); 
    }

}


