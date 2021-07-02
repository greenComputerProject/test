    
    
    let slideHidden = document.querySelectorAll(".main-section-image-slide");
    let slideVisible = document.querySelectorAll(".main-section-image-slide-visible")[0];
    let boxes = document.querySelectorAll(".box");


    let slideAnimation = function(slide){
        slide.animate(
            [{
                "left" : "3%",
                opacity: 0.3
            },{
                "left": "0",
                opacity: 1
            }],
            300
        );
    }

    let changeSelectedSlide = function(selectedSlide){
        selectedSlide.animate(
            [{
                opacity: 1
            },{
                opacity: 0.3
            }],
            100
        );

    }
    
    let gameLogoAnimation = function(gameLogo){
        gameLogo.animate(
            [{
                opacity: 0,
                "left" : "14%"   
            },{
                opacity: 1,
                "left": "0"
            }],
            350
        );
    }

    let textAnimation = function(title, content){
        title.animate([{
            opacity: 0.5
        },{
            opacity: 1
        }], 300);

        content.animate([{
            opacity: 0.5
        },{
            opacity: 1
        }], 300);
    }

    let boxAnimation = function(box){
        console.log(box);
        box.animate([{
            background : "rgb(22, 22, 22)"
        },{
            background : "rgb(55, 55, 55)"
        }], 300);
    }

    let changeSlide = function(id){
        slideVisible = document.querySelectorAll(".main-section-image-slide-visible")[0];
        let selectedSlide = document.querySelectorAll("#" + id + ".main-section-image-slide")[0];
        if(selectedSlide == null){
            selectedSlide = slideVisible;
        }
        let selectedBox = document.querySelectorAll("#" + id + ".box")[0];
        let gameLogo;
        let title = selectedSlide.getElementsByClassName("title")[0]; 
        let content = selectedSlide.getElementsByClassName("content")[0];
        if(selectedSlide != null){
            if(selectedSlide != slideVisible){
                changeSelectedSlide(slideVisible);
                selectedSlide.setAttribute("class", "main-section-image-slide-visible");
                
                gameLogo = selectedSlide.getElementsByClassName("game-logo")[0];

                slideVisible.setAttribute("class", "main-section-image-slide");
                slideAnimation(selectedSlide);
                textAnimation(title,content);
                gameLogoAnimation(gameLogo);
                boxAnimation(selectedBox);
            }
        } 
    }

    let clickBox  = function(id){
        changeSlide(id);
        
    }

    let boxIds = ["box1", "box2", "box3"];
    let count;
    let interval = setInterval(
        () => {
            slideVisible = document.querySelectorAll(".main-section-image-slide-visible")[0];
            count = boxIds.indexOf(slideVisible.id);
            if(count === 2   ){
                count = 0;
            } else {
                count ++;
            }
            clickBox(boxIds[count]);
            
            
        }, 4000
    );

