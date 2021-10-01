$('a').click(function(){
  var currentAnchor = $(this);
  console.log(currentAnchor.attr('href'));
});