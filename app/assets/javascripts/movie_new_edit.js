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

function validate_youtube_url(input) {
    var regExp = RegExp(/(https:\/\/www\.youtube\.com\/)(watch\?v=|embed\/)[a-zA-Z0-9]+/);
    if (regExp.test(input) || input == "") {
        $("#trailer").addClass("is-valid");
        $("#trailer").removeClass("is-invalid");
        return true;
    } else {
        $("#trailer").removeClass("is-valid");
        $("#trailer").addClass("is-invalid");
        return false;
    }
}


$(document).ready(function () {
    if ($("#edit-movie-form").length > 0 || $("#new-movie-form").length > 0) {
        var title_before_edit = document.getElementById("movie_title").value;
        var year_before_edit = document.getElementById("movie_year").value;
        var trailer_before_edit = document.getElementById("movie_youtube_trailer_url").value;

            $("#title").focusout(function () {
            var formInput = document.getElementById("movie_title").value;
            if (!(validate_presence("#title", formInput))) {
                document.getElementById("title-error").innerHTML = "Title must be filled out";
                document.getElementById("movie_title").value = title_before_edit;
            }
            ;
        });


        $("#year").focusout(function () {
            var formInput = document.getElementById("movie_year").value;
            if (!(validate_presence("#year", formInput))) {
                document.getElementById("movie_year").value = year_before_edit;
                document.getElementById("year-error").innerHTML = "Year must be filled out";
            } else {
                if (!(validate_length("#year", formInput, 4))) {
                    document.getElementById("movie_year").value = year_before_edit;
                    document.getElementById("year-error").innerHTML = "Year must be four digits";
                }
            }
        });

        $("#trailer").focusout(function () {
            var formInput = document.getElementById("movie_youtube_trailer_url").value;
            console.log(formInput);
            if (!(validate_youtube_url(formInput))) {
                document.getElementById("movie_youtube_trailer_url").value = trailer_before_edit;
                document.getElementById("trailer-error").innerHTML = "Trailer must be valid youtube link";
            }
        });

        /*
        $("#movie_showtimes_attributes_" + 0 + "_cinema").change(function(){
            alert($("#edit-showtime-form").length);
            if (document.getElementById("movie_showtimes_attributes_" + 0 + "_date").value == "") {
                document.getElementById("showtime-error").innerHTML = "do not forget to insert a date";
                $("#showtime-error").css("color", "red");
            } else {
                document.getElementById("showtime-error").innerHTML = "";
                return true;
            }
        });
        */

        $("#submit").click(function (event) {
            if (!(validate_presence("#title", document.getElementById("movie_title").value))) {
                event.preventDefault();
                window.alert("Please insert title");
            } else if (!(validate_presence("#year", document.getElementById("movie_year").value))) {
                event.preventDefault();
                window.alert("Please correct year");
            }
            /*else if (!(validate_presence("#movie_showtimes_attributes_" + 0 + "_cinema", document.getElementById("movie_showtimes_attributes_" + 0 + "_date").value))){
                           event.preventDefault();
                           window.alert("Please correct showtime")
                       }*/
        });
    }
});