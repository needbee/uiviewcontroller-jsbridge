$(document).ready(function() {
    document.getElementById('link').addEventListener('click',
        function(evt){
            // update title
            var num = $('#link').text();
            num++;
            $('#link').text(num);
                           
            // send new title to cocoa
            window.location = "cocoa://tappedLink/"+num;
        }
    );
});

function updateTitle(num) {
    $('#link').text(num);
}
