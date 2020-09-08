$(function() {
    $('.btn_login').on('click', () => {
        $('.modal_wrap').fadeIn()
    })
   
    $('.btn_close').on('click', () => {
        $('.modal_wrap').fadeOut()
    })
})