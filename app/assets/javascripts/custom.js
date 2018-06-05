function validate_presence(input) {
    if (input == "" || input == null) {
        return false;
    } else {
        return true;
    }
}

function validate_length(input, num) {
    if (input.length != num) {
        return false;
    } else {
        return true;
    }
}

function validate_numericality(input) {
    if (input.match(/[a-zA-Z]/)) {
        return false;
    } else {
        return true;
    }
}

function validate_year(input) {
    if (validate_length(input, 4) && validate_numericality(input)) {
        return true;
    } else {
        return false;
    }
}

function validate_youtube_url(input) {
    var regExp = RegExp(/(https:\/\/www\.youtube\.com\/)(watch\?v=|embed\/)[a-zA-Z0-9]+/);
    if (regExp.test(input) || input == "") {
        return true;
    } else {
        return false;
    }
};

function validate_birthday(input) {
    var regExp = RegExp(/\d{2}\.\d{2}\.\d{4}/);
    var date = input.toString();
    if (regExp.test(date) && date.length == 10) {
        return true;
    } else {
        return false;
    }
}

function mark_as_valid(validatable_obj) {
    validatable_obj.classList.add("is-valid");
    validatable_obj.classList.remove("is-invalid");
}

function mark_as_invalid(validatable_obj) {
    validatable_obj.classList.remove("is-valid");
    validatable_obj.classList.add("is-invalid");
}

//tabs
function mark_as_active(tab_class){
    document.querySelector("[data-theme =" + tab_class + "]").classList.add("active");
}

function mark_as_inactive(){
    document.querySelectorAll(".tablinks").forEach(function(tablink){
        tablink.classList.remove("active");
    })
}

function hide_all_tabcontent(){
    document.querySelectorAll(".tabcontent").forEach(function(content){
        content.style.display = "none";
    });
    mark_as_inactive();
}

function show_one_tabcontent(tab_class){
    document.querySelector("." + tab_class).style.display = "block";
    mark_as_active(tab_class);
}

function openTab(tab_class) {
    hide_all_tabcontent();
    show_one_tabcontent(tab_class);
}



$(document).ready(function () {

    document.querySelectorAll('.validatable').forEach(function (validatable) {

        var error_tag = document.createElement("error-tag");
        validatable.appendChild(error_tag);

        validatable.addEventListener('input', function input_change() {
            var val = validatable.querySelector("input[type=text]").value;
            var lab = validatable.querySelector("label").innerHTML;


            if (validatable.className.includes("presence")) {
                if (val == "") {
                    mark_as_invalid(validatable);
                    error_tag.innerHTML = lab + " can't be blank";
                    return false;
                } else if (validatable.className.includes("year")) {
                    if (validate_year(val)) {
                        mark_as_valid(validatable);
                        error_tag.innerHTML = "";
                        return true;
                    } else {
                        error_tag.innerHTML = lab + " must be four digits";
                        return false;
                    }
                } else {
                    mark_as_valid(validatable);
                    error_tag.innerHTML = "";
                    return true;
                }
            }


            if (validatable.className.includes("custom-function")) {
                var fcn_string = validatable.dataset.function + "(" + val + ")";
                if (validatable.dataset.function == "validate_youtube_url") {
                    if (validate_youtube_url(val)) {
                        error_tag.innerHTML = "";
                        mark_as_valid(validatable);
                        return true;
                    } else {
                        error_tag.innerHTML = lab + " must be valid youtube link";
                        mark_as_invalid(validatable);
                        return false;
                    }
                } else if (validatable.dataset.function == "validate_birthday") {
                    if (validate_birthday(val)) {
                        error_tag.innerHTML = "";
                        mark_as_valid(validatable);
                        return true;
                    } else {
                        error_tag.innerHTML = lab + " must be dd.mm.yyyy";
                        mark_as_invalid(validatable);
                        return false;
                    }
                }
            }

        });
    });


    document.querySelectorAll('.select').forEach(function select_change(validatable) {

        var error_tag = document.createElement("error-tag");
        validatable.appendChild(error_tag);

        validatable.addEventListener("change", function () {

            var new_sel_val = validatable.querySelector("select").value;
            var lab = validatable.querySelector("label").innerHTML;

            if (validatable.className.includes("select")) {
                if (validate_presence(new_sel_val)) {
                    error_tag.innerHTML = "";
                    mark_as_valid(validatable);
                    return true;
                } else {
                    error_tag.innerHTML = lab + " can't be blank";
                    mark_as_invalid(validatable);
                    return false;
                };

            };
        });

    });

    //js for tabs
    hide_all_tabcontent();
    show_one_tabcontent(document.querySelector("[data-default=default]").dataset.theme);


    document.querySelectorAll(".tablinks").forEach(function (tablink) {

        tablink.addEventListener("click", function () {
            openTab(tablink.dataset.theme);
        });
    });

});


// validatable.querySelectorAll("input[type=text]")[0].value
// validatable.querySelector("input[type=text]")
//
// [1,2,3].querySelector.val()

//jQuery Collection everything done on this collection will automatically done for each element which fits
//additional methods
//$("#title).val()

//querySelectorAll returns NodeList (which is not an Array) but you can use as one
//querySelector returns first fitting object
//document.getElementById("title").value
//document.getElementsByClassName("validatable")[0].value
//the Document method querySelector() returns the first Element within the document that matches the specified selector, or group of selectors. If no matches are found, null is returned.




