$(function() {
    $('.show_comments_open').on('click', () => {
        $('.show_comments_index').slideDown(400, function() {
            $('.show_comments_open').fadeOut();
        });
    })
   
    $('.btn_close-comment').on('click', () => {
        $('.show_comments_index').fadeOut();
    })
})