
let browsUrl = "http://localhost:8080/browse"

let url = new URL(window.location.href);
let decodedUrl = decodeURIComponent(url);

let orderParam = url.searchParams.get("order");
let dirParam = url.searchParams.get("direction");
//현재 url 에 포함됨 filterList 파라미터들의 갯수
let filters = url.searchParams.getAll("filterList");
let searchValue = url.searchParams.get("keyword");

let input = document.querySelectorAll(".navbar-search-form form .input input")[0];




// 이벤트 발생시 실행되는 메서드들
let setOrderSpan = function(orderValue) {
     //정렬기준 : <span> </span> 태그
    let displayOrder = document.querySelectorAll(".order-form .title span")[0];
    let orderText = document.querySelectorAll("button[value='"+ orderValue +"']")[0].textContent;

    displayOrder.innerHTML = orderText;
}



//정렬기준 눌렸을때 url 이동
let clickSort = function(value){

    let currentSort = "&order=" + orderParam + "&direction=" + dirParam;
    window.location.href = String(decodedUrl).replace(currentSort, value); 
}



// 기존 문자열 , 끊을 지점 , 추가할 새로울 문자열
let spliceString = function(string, a, newString) {
    return string.slice(0, a) + newString + string.slice(a+newString.length);
}

let clickPageLink = function(page) {

    let setPage = "?pageNum=" + page.textContent;
    let currentUrl = window.location.href;

    let urlToMove = spliceString(currentUrl, browsUrl.length , setPage);
 
    window.location.href = urlToMove;
}




let clickResetFilter = function() {
    window.location.href = getFilterCleanUrl();
}

let getFilterCleanUrl = function() {
    let filterString = "";
    for(i=0 ; i< filters.length ; i++){
        filterString += "&filterList=" + filters[i];
    }
    return String(decodedUrl).replace(filterString, ""); 
}

let clickFilterButton = function(filter) {

    let value = filter.getAttribute("value");

    if(filters.includes(value)){
        let currentUrl = decodeURIComponent(window.location.href);
        let newUrl = currentUrl.replace("&filterList=" + value, "");

        window.location.href = newUrl;
    }
    else {
    let currentUrl  = window.location.href;
    let urlToMove = currentUrl + "&filterList=" + value;
    
    window.location.href = urlToMove;
    }
}

//for search
let clickSearchInput = function() {

    let noFilterUrl = getFilterCleanUrl();

    let value = document.querySelectorAll(".navbar-search-form form .input input")[0].value;
    if(searchValue != null){

        if(searchValue === value){
            location.reload();
        } else {
            let newKeyword = "&keyword=" + value;
            let newUrl = noFilterUrl.replace("&keyword=" + searchValue, newKeyword);
            window.location.href = newUrl;
        }
    } else {
        let newUrl = noFilterUrl + "&keyword=" + value;
        window.location.href = newUrl;
    }

}

//엔터 키 눌렸을 시 검색처리
input.addEventListener(

    'keydown', function(event) {
        if(event.keyCode === 13){
            event.preventDefault();
            if(input.value !== null || input.value !== ""){
                clickSearchInput();
            } else{
                return;
            }
        }
    }
);

// --- 페이지 로드시 실행되는 메서드들 ----
let changeFiltersColor = function() {
    let filterButtons = document.querySelectorAll(".category .list button");

    for(i=0; i< filterButtons.length ; i++){
        if(filters.includes(
            filterButtons[i].getAttribute("value"))){
                filterButtons[i].style.color = "white"
        }
        else {
            filterButtons[i].style.color = "rgb(121, 121, 121)";
        }
    }
}

let setFilterNumber = function() {
    let filterNum = document.querySelector(".head-text .number");
    filterNum.innerHTML = filters.length;
}

let setOrder = function(){    
    let startNum = (browsUrl + "?pageNum=1&").length;
    let lastNum =  startNum + "order=g.regDate&direction=asc".length -2;
    //현재 url에서 order 부터 direction 까지 자름
    let selected = window.location.href.substring(startNum, lastNum);

    //정렬기준 목록의 텍스트
    let orderText = "";
    
    //정렬 기준들의 value 를 가져오기 위한 변수들
    let orders = document.querySelectorAll(".order-form .list button");
    let orderValues = [];
    //value들을 배열에 넣는다
    for(i=0; i <orders.length ; i++){
        orderValues.push(orders[i].getAttribute("value"));
    }

         // 현재 url 의 정렬기준과 같은 정렬 기준의 텍스트을 spane 에 삽입 
        for(i=0 ; i<orderValues.length ; i++){

            if(orderValues[i].includes(selected)){
                setOrderSpan(orderValues[i])
            }
        }  
}

let setOnclickAttributesToFilters = function() {
    let filterButton = document.querySelectorAll(".category .list button");

    for(i=0; i < filterButton.length ; i++){
        filterButton[i].setAttribute("onclick", "clickFilterButton(this)");
    }
}
let setSearchValue = function() {
    let input = document.querySelectorAll(".navbar-search-form form .input input")[0];
    
    if(searchValue != null){
        input.setAttribute("value", searchValue);
    } else {
        input.setAttribute("placeholder", "검색");    

    }
}

//검색 창에 최근 검색된 텍스트를 보여줌
setSearchValue();
//필터 버튼들에게 onclick attribute 추가
setOnclickAttributesToFilters();
//선택된 필터들 하얀색 처리
changeFiltersColor();
//필터 창에 나타날 필터 수
setFilterNumber();
//reload 시 함수 실행
setOrder();
