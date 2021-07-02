let changeNavbarSearch = function() {
    let searchLinks = document.querySelectorAll(".navbar-search-links li");
	console.log(searchLinks)
    searchLinks[0].innerHTML = '<a href="/" id="not-selected" onclick="clickSearch(this)">< 메인으로 돌아가기</a>'
    searchLinks[1].innerHTML = "<span>"+ 
        "| 회원가입"
    +"</span"

    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
    searchForm.style.display = "none";
    console.log(searchForm);
}
//navbar-search 화면 변경
changeNavbarSearch();

//여러 메서드에서 쓰일 것이므로 전역변수로 선언
let span = document.querySelectorAll(".input-email span")[0];


let checkEmail = function(value) {

    if(value !== null && value !==""){
        $.ajax({
            type: 'POST',
            url: '/user/check',
            data: value,
            contentType: 'text/plain',
            dataType: 'json',
            success: function(result) {
                if(result){
                    span.style.display = "block";
                } else{
                    span.style.display = "none";
                }
            },
            error : function(error) {
                alert('CHECKEMAIL ERROR')
            }
        })
    } else {
        return;
    }
   
}


let button = document.querySelector(".signup-form button");
button.addEventListener("click", function(event) {

    event.preventDefault();

    let username = document.querySelector("#name").value;
    let useremail = document.querySelector("#email").value;
    let userpassword = document.querySelector("#password").value;

    
    if(username === null || username === "" || useremail === null || useremail === "" || userpassword === null || userpassword === ""){
        alert("전부 입력해주세요!")
    } else {
        if(span.style.display === "none"){    
        
            data = {
                name : username,
                email : useremail,
                password : userpassword
            }

            $.ajax({
                type: 'post',
                url: '/user/signup',
                data: JSON.stringify(data),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function(result) {
                    if(result){
                        if(confirm("회원가입에 성공했습니다. 로그인하시겠습니까?")){
                            window.location.href = "/user/login";
                        } else {
                            window.location.href = "/";
                        }
                    } else {
                        alert("에러 발생")
                        window.location.href = "/user/signup"
                    }
                }, error : function (error) {
                    alert(error);
                }
            })
    
        } else if(span.style.display === "block"){
            alert("이메일을 확인해주세요!");
        } 
    }
})