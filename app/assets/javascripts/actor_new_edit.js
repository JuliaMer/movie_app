/* not necessary anymore, now everything included in custom.js

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
    if ($("#new-actor-form").length > 0 || $("#edit-actor-form").length > 0) {
        var name_before_edit = document.getElementById("actor_name").value;
        var birthday_before_edit = document.getElementById("actor_birthday").value;

        $("#name").focusout(function () {
            var formInput = document.getElementById("actor_name").value;
            if(!(validate_presence("#name", formInput))){
                document.getElementById("name-error").innerHTML = "Name must be filled out";
                document.getElementById("actor_name").value = name_before_edit;
            };
        });


        $("#birthday").focusout(function () {
            var formInput = document.getElementById("actor_birthday").value;
            if (!(validate_presence("#birthday", formInput))) {
                document.getElementById("birthday-error").innerHTML = "Birthday must be filled out";
                document.getElementById("actor_birthday").value = birthday_before_edit;
            } else {
                if (!(validate_length("#birthday", formInput, 10))) {
                    document.getElementById("actor_birthday").value = birthday_before_edit;
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

*/