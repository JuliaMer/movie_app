function validate_presence(id, input) {
    if (input == "") {
        $(id).addClass("is-invalid");
        $(id).removeClass("is-valid");
        return false;
    } else {
        $(id).removeClass("is-invalid");
        $(id).addClass("is-valid");
        return true;
    }
};

function validate_length(id, input, num) {
    if (input.length != num) {
        $(id).addClass("is-invalid");
        $(id).removeClass("is-valid");
        return false;
    } else {
        $(id).removeClass("is-invalid");
        $(id).addClass("is-valid");
        return true;
    }
};

$(document).ready(function () {
    if ($("#new-movie-form").length > 0) {

        window.alert("Hello, you are about to create a new movie. At least title and year are required!");

        $("#title").focusout(function () {
            var formInput = document.getElementById("movie_title").value;
            if(!(validate_presence("#title", formInput))){
                document.getElementById("title-error").innerHTML = "Title must be filled out";
            };
        });


        $("#year").focusout(function () {
            var formInput = document.getElementById("movie_year").value;
            if (!(validate_presence("#year", formInput))) {
                document.getElementById("year-error").innerHTML = "Year must be filled out";
            } else {
                if (!(validate_length("#year", formInput, 4))) {
                    document.getElementById("movie_year").value = "";
                    document.getElementById("year-error").innerHTML = "Year must be four digits";
                }
            }
        });

        $("#submit").click(function (event) {
            if (!(validate_presence("#title", document.getElementById("movie_title").value))) {
                event.preventDefault();
                window.alert("Please insert title");
            } else if (!(validate_presence("#year", document.getElementById("movie_year").value))) {
                event.preventDefault();
                window.alert("Please correct year");
            }
        });

    }
});

//alternative ajax validation

//$("#title").fadeOut(500).fadeIn(500);

/*
$("#title").ajaxSend(function(){
   alert("Triggered ajaxSend handler.")
});
$( "#title" ).click(function() {
   $( "#title" ).load( "movies/new.html" );
});

 */


//old version (style with query css), try... catch...
/*
$(document).ready(function () {
    window.alert("Hello, you are about to create a new movie. At least title and year are required!");
    //window.alert(document.forms.length);
    //window.alert(document.forms[0]);
    //window.alert(document.forms);
    //var formAction = form.attr("action");
});

$("#title").focusout(function () {
    var formInput = document.getElementById("movie_title").value;
    var redBorder = {
        "border-style": "3px",
        "border-radius": "5px", "border-color": "red"
    };
    var greenBorder = {
        "border-style": "3px",
        "border-radius": "5px", "border-color": "green"
    };
    try {
        if (formInput == "") {
            $(document.getElementById("movie_title")).css(redBorder);
            throw "Title must be filled out";
        } else {
            $(document.getElementById("movie_title")).css(greenBorder);
            document.getElementById("title-error").innerHTML = "";
        }
    } catch (err) {
        document.getElementById("title-error").innerHTML = err;
    }
});

$("#year").focusout(function () {
    var formInput = document.getElementById("movie_year").value;
    var redBorder = {
        "border-style": "3px",
        "border-radius": "5px", "border-color": "red"
    };
    var greenBorder = {
        "border-style": "3px",
        "border-radius": "5px", "border-color": "green"
    };
    try {
        if (formInput == "") {
            $(document.getElementById("movie_year")).css(redBorder);
            throw "Year must be filled out";
        } else if (formInput.length != 4) {
            document.getElementById("movie_year").value = "";
            $(document.getElementById("movie_year")).css(redBorder);
            throw "Year must be four digits";
        } else {
            $(document.getElementById("movie_year")).css(greenBorder);
            document.getElementById("year-error").innerHTML = "";
        }
    } catch (err) {
        document.getElementById("year-error").innerHTML = err;
    }
});

*/
