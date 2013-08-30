// click on category link to populate post_categories text field
$(document).ready(function() {
  $(".category").click(function(e){
    e.preventDefault();
    $("#post_category").val($(this).text());
    $("#post_category_id").val($(this).data("category-id"));
  });
});
