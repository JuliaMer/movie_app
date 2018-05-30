$(document).ready(function(){

    $("#add-showtime").click(function () {
           // $.get({url: "43", sync: false, success: function(data){
            //    $("#add-showtime").html(data);
              //  }})
        $.get("43", function( data ) {
            alert(data.form["showtime-error"]);
            $( "#add-showtime" ).html( data[0] );
        });
        });
});