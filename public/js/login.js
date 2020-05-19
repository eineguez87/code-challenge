$(document).ready(function() {
    $( "button#submit" ).on('click',function( event ) {

        let username = $('#username').val();
        let password = $('#password').val();
        
        $.ajax({

            // The URL for the request
            url: "user/login",

            // The data to send (will be converted to a query string)
            data: {
                username: username,
                password: password,
            },

            // Whether this is a POST or GET request
            type: "POST",

            // The type of data we expect back
            dataType : "json",
        })
        // Code to run if the request succeeds (is done);
        // The response is passed to the function
            .done(function( json ) {
                if (json.success) {
                    alert(json.message);
                }

            })
            // Code to run if the request fails; the raw request and
            // status codes are passed to the function
            .fail(function( xhr, status, errorThrown ) {
                alert( "Invalid Username/Password Combination" );
            })
    });
});





