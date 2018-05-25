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
    if ($("#new-actor-form").length > 0) {

        window.alert("Hello, you are about to create a new actor. Name and birthday are required");

        $("#name").focusout(function () {
            var formInput = document.getElementById("actor_name").value;
            if(!(validate_presence("#name", formInput))){
                document.getElementById("name-error").innerHTML = "Name must be filled out";
            };
        });


        $("#birthday").focusout(function () {
            var formInput = document.getElementById("actor_birthday").value;
            if (!(validate_presence("#birthday", formInput))) {
                document.getElementById("birthday-error").innerHTML = "Birthday must be filled out";
            } else {
                if (!(validate_length("#birthday", formInput, 10))) {
                    document.getElementById("actor_birthday").value = "";
                    document.getElementById("birthday-error").innerHTML = "Birthday must be dd.mm.yyyy";
                }
            }
        });

        $("#submit").click(function (event) {
            if (!(validate_presence("#name", document.getElementById("actor_name").value))) {
                event.preventDefault();
                window.alert("Please insert name");
            } else if (!(validate_presence("#brithday", document.getElementById("actor_birthday").value))) {
                event.preventDefault();
                window.alert("Please correct birthday");
            }
        });

    }
});
