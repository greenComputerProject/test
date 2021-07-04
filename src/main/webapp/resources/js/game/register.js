


let clickOption = function(event) {

    let inputTag  = document.querySelectorAll("#formGameTag input")[0];
    let addedTags = inputTag.getAttribute("value");
    let optionValue = event.target.value + " ";

    addedTags += optionValue;

    inputTag.setAttribute("value", addedTags);
}

let resetTag = function () {
    
    let inputTag  = document.querySelectorAll("#formGameTag input")[0];
    inputTag.setAttribute("value", "");
}