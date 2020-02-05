
$(function(){ 
  function buildHTML(message){
   if ( message.image ) {
     var html =
      `
         <div class="upper-message_28">
           <div class="upper-message__user-name_29">
             ${message.user_name}
           </div>
           <div class="upper-message__date_30">
             ${message.created_at}
           </div>
         </div>
         <div class="lower-message_32">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
         <img src=${message.image} >
       `
     return html;
   } else {
     var html =
      `
         <div class="upper-message_28">
           <div class="upper-message__user-name_29">
             ${message.user_name}
           </div>
           <div class="upper-message__date_30">
             ${message.created_at}
           </div>
         </div>
         <div class="lower-message_32">
           <p class="lower-message__content">
             ${message.content}
           </p>
         </div>
       `
     return html;
   };
 }
 $('#new_message').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action')
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false,
  })
    // サーバーから値が正しく返ってきた場合
   .done(function(data){
     var html = buildHTML(data);
     $('.message').append(html);
     $('form')[0].reset();
    //2/5_ここの設定が怪しい↓
     $('.message').animate({ scrollTop: $('.message')[0].scrollHeight});
    //  $this.get(0).reset();
    // autoScroll(); 変化無し
    })
      .fail(function() {
        alert('メッセージを送信できません');
      });
      // 追記
      return false;
 })
});