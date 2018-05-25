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

$(document).ready(function () {
    if ($("#new-role-form").length > 0) {

        window.alert("Hello, you are about to create a new role. Actor, movie and character are required!");

        $("#actor").click(function () {
            var formInput = document.getElementById("role_actor_id").value;
            if(!(validate_presence("#actor", formInput))){
                document.getElementById("actor-error").innerHTML = "Actor must be selected";
            };
        });

        $("#movie").click(function () {
            var formInput = document.getElementById("role_movie_id").value;
            if (!(validate_presence("#movie", formInput))) {
                document.getElementById("movie-error").innerHTML = "Movie must be selected";
            }
        });

        $("#character").focusout(function () {
            var formInput = document.getElementById("role_character").value;
            if(!(validate_presence("#character", formInput))){
                document.getElementById("character-error").innerHTML = "Character must be filled out";
            };
        });

        $("#submit").click(function (event) {
            if(!(validate_presence("#actor", document.getElementById("role_actor_id").value))){
                event.preventDefault();
                window.alert("Please select actor");
            } else if (!(validate_presence("#movie", document.getElementById("role_movie_id").value))){
                event.preventDefault();
                window.alert("Please select movie");
            } else if (!(validate_presence("#character", document.getElementById("role_character").value))){
                event.preventDefault();
                window.alert("Please insert character");
            }
        });

    }
});
