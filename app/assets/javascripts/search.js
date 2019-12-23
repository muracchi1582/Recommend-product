$(function() {

  var html = `<div class = "search_content__image">
                <a href = "/products/:id/search">
                  <img class = "search__index__image" src = "https://s3-ap-northeast-1.amazonaws.com/uedajyo/uploads/product/image/16/61ab1juvGjL._SL1500_.jpg">
                </a>
              </div>
              <div class = "search_content__title">
                <a class = "title__text" href = "/products/:id">${product.title}</a>
              </div>
              <div class = "search_content__info">
                <a class = "info__text" href="/products/:id">${product.information}</a>
              </div>`
  $(".search-content").append(html);

  

  $(".search__field").on("keyup", function() {
    var input = $(".search__field").val();
    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(products) {
      search_list.empty();
      $(".search_content").empty();
      if (products.length !== 0) {
        products.forEach(function(product){
          appendProduct(product);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
  });
});