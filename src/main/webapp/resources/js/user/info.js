let changeNavbarSearch = function() {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="/" id="not-selected" onclick="clickSearch(this)">< 메인으로 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 내 정보 "
    +"</span"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
changeNavbarSearch();

let clickModBtn = function(){
    
    let username = document.querySelector("#name").value;
    let useremail = document.querySelector("#email").value;
    let userpassword = document.querySelector("#password").value;

    data = {
        name : username,
        email: useremail,
        password : userpassword
    }

    $.ajax({
        type: "POST",
        url: "/user/info",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function(result) {
            if(result){
                alert("성공적으로 수정되었습니다.")
                window.location.href = "/"
            } else{
                alert("수정에 실패했습니다. 다시 시도해주세요.")
            }
        },
        error: function(error) {
            alert(error);
        }
    })
}

function clickRemoveBtn() {
    if(confirm("정말로 탈퇴하시겠습니까?")){
        $.ajax({
        type:'POST',
        url: '/user/remove',
        dataType: 'json',
        success: function(result) {
            if(result){
                alert("성공적으로 탈퇴되었습니다.")
                window.location.href = "/"
            } else{
                alert("탈퇴에 실패했습니다.")
            }
        },
        error: function(error) {
            alert(error);
        }
        })
        
    } else {
        return;
    }
}