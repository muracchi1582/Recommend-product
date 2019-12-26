$(function() {
  function appendProduct(product){
    var image = (product.image_url)
    var title = (product.title)
    var information = (product.information)
    var html = `<div class = "search_content__image">
                  <a href = "/products/:id/search">
                    <img class = "search__index__image" src = "${image}">
                  </a>
                </div>
                <div class = "search_content__title">
                  <a class = "title__text" href = "/products/:id">${title}</a>
                </div>
                <div class = "search_content__info">
                  <a class = "info__text" href="/products/:id">${information}</a>
                </div>`
      return html;
  }

  $(".search__field").on("keyup", function(e) {
    var input = $(".search__field").val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(products) {
      $(".search__field").empty();
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