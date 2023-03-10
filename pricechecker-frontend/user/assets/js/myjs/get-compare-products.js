async function getAmazonProductsForComparing(searchCategory, searchString,currentPage, maxNumberOfProducts){
    let resultHtml = '';
    let response = {};
    if(isMockData){
        response = await getAmazonProductsFromMock(searchCategory, searchString,currentPage, maxNumberOfProducts);
    }else {
        response = await getAmazonProductsFromApi("", searchString, currentPage,  maxNumberOfProducts);
    }
    if(response['error'] === 'ok'){
        resultHtml += convertResponse2HtmlForCompare(response['data'], "Amazon");
    }else {
        resultHtml += response['error'];
    }   
    resultHtml += '</div>';
    return resultHtml;
}

async function getEbayProductsForComparing(searchCategory, searchString, currentPage , maxNumberOfProducts){
    let resultHtml = '';
    let response = {};
    if(isMockData){
        response = await getEbayProductsFromMock(searchCategory, searchString,currentPage, maxNumberOfProducts);
    }else {
        response = await getEbayProductsFromAPI(searchCategory, searchString,currentPage, maxNumberOfProducts);
    }
    if(response['error'] === 'ok'){
        resultHtml += convertResponse2HtmlForCompare(response['data'], "Ebay");
    }else {
        resultHtml += response['error'];
    }
    resultHtml += '</div>';
    return resultHtml;
}

async function getWalmartProductsForComparing(searchCategory, searchString, currentPage, maxNumberOfProducts){
    let resultHtml = '';
    let response = {};
    if(isMockData){
        response = await getWalmartProductsFromMock(searchCategory, searchString,currentPage, maxNumberOfProducts);
    }else {
        response = await getWalmartFromApi(searchCategory, searchString,currentPage, maxNumberOfProducts);
    }
    if(response['error'] === 'ok'){
        resultHtml += convertResponse2HtmlForCompare(response['data'], "Walmart");
    }else {
        resultHtml += response['error'];
    }
    resultHtml += '</div>';
    return resultHtml;
}
function convertResponse2HtmlForCompare(response, shopName) {
  let resultHtml = "";
  let _length = response.length;
  console.log(response);
  if (_length > 0) {
    let i = 0;
    let b = { "shop-name": shopName.toLowerCase(), data: response[0] };
    makeTable(b);
    resultHtml =
      '<div class="container"><div class="border-bottom border-color-1 mb-2">\n' +
      '        <h3 class="d-inline-block section-title section-title__full mb-0 pb-2 font-size-22">Products From ' +
      shopName +
      "</h3>\n" +
      "    </div></div>\n" +
      '    <div class="container">\n' +
      "        <!-- Brand Carousel -->\n" +
      '        <div class="container">\n' +
      "            <!-- Brand Carousel -->\n" +
      '            <div class="mb-6">\n' +
      '                <div class="py-2 border-top border-bottom">\n' +
      '                    <div id="product-carousel-' + shopName + '" class="js-slick-carousel u-slick my-1"\n' +
      '                         data-slides-show="4"\n' +
      '                         data-slides-scroll="1"\n' +
      '                         data-arrows-classes="d-none d-lg-inline-block u-slick__arrow-normal u-slick__arrow-centered--y"\n' +
      '                         data-arrow-left-classes="fa fa-angle-left u-slick__arrow-classic-inner--left z-index-9"\n' +
      '                         data-arrow-right-classes="fa fa-angle-right u-slick__arrow-classic-inner--right"\n' +
      "                         data-responsive='[{\n" +
      '                                "breakpoint": 992,\n' +
      '                                "settings": {\n' +
      '                                    "slidesToShow": 2\n' +
      "                                }\n" +
      "                            }, {\n" +
      '                                "breakpoint": 768,\n' +
      '                                "settings": {\n' +
      '                                    "slidesToShow": 1\n' +
      "                                }\n" +
      "                            }, {\n" +
      '                                "breakpoint": 554,\n' +
      '                                "settings": {\n' +
      '                                    "slidesToShow": 1\n' +
      "                                }\n" +
      "                            }]'>";
    for (i = 0; i < _length; i++) {
      let title = response[i]["title"];
      let description = response[i]["description"];
      let product_url = response[i]["product_url"];
      let image_url = response[i]["image_url"];
      let price = response[i]["price"];
      resultHtml +=
        '<div class="js-slide">\n' +
        '                                <div class="product-item">\n' +
        '                                    <div class="product-item__outer h-100">\n' +
        '                                        <div class="product-item__inner px-wd-4 p-2 p-md-3">\n' +
        '                                            <div class="product-item__body pb-xl-2">\n' +
        '                                                <h5 class="mb-1 product-item__title"><a href="' +
        product_url +
        '" class="text-blue font-weight-bold">' +
        title +
        "</a></h5>\n" +
        '                                                <div class="mb-2">\n' +
        '                                                    <a href="' +
        product_url +
        '" class="d-block text-center"><img class="compare-image" src="' +
        image_url +
        '" alt="Image Description"></a>\n' +
        "                                                </div>\n" +
        '                                                <div class="flex-center-between mb-1">\n' +
        '                                                    <div class="prodcut-price">\n' +
        '                                                        <div class="text-gray-100">' +
        price +
        "</div>\n" +
        "                                                    </div>\n" +
        '                                                    <div class="d-none d-xl-block prodcut-add-cart">\n' +
        "                                                        <a onclick=\"onClickedCart('" +
        title +
        "','" +
        description +
        "','" +
        product_url +
        "','" +
        image_url +
        "','" +
        price +
        '\')" class="btn-add-cart btn-primary transition-3d-hover"><i class="ec ec-add-to-cart"></i></a>\n' +
        "                                                    </div>\n" +
        "                                                </div>\n" +
        "                                            </div>\n" +
        '                                            <div class="product-item__footer">\n' +
        '                                                <div class="border-top pt-2 flex-center-between flex-wrap">\n' +
        '                                                    <a data-tip="Go to Compare" onclick="function clicked(name) {goComparePage(name);} clicked(\'' +
        title +
        '\')" class="text-gray-6 font-size-13"><i class="ec ec-compare mr-1 font-size-15"></i> Compare</a>\n' +
        '                                                    <a  data-tip="Add to Wishlist" onclick="goFavouritePage(\'' +
        title +
        "','" +
        description +
        "','" +
        product_url +
        "','" +
        image_url +
        "','" +
        price +
        '\')" class="text-gray-6 font-size-13"><i class="ec ec-favorites mr-1 font-size-15"></i> Wishlist</a>\n' +
        "                                                </div>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                    </div>\n" +
        "                                </div>\n" +
        "                        </div>";
    }
    resultHtml +=
      "</div>\n" +
      "                </div>\n" +
      "            </div>\n" +
      "            <!-- End Brand Carousel -->\n" +
      "        </div>";
  }
  return resultHtml;
}
function makeTable(value) {
  let curren_url = window.location.href;
	if(checkExistOrNot(curren_url, "compare")){
		let shopName = value['shop-name'];
	    let data = value['data'];
	    let title = data['title'];
	    let description = data['description'];
	    let product_url = data['product_url'];
	    let image_url = data['image_url'];
	    let price = data['price'];
	    document.getElementById("td-product-compare-" + shopName).innerHTML = '<a href="' + product_url + '" class="product">\n' +
	        '<div class="product-compare-image">\n' +
	        '<div class="d-flex mb-3">\n' +
	        '<img class="img-fluid mx-auto" src="' + image_url + '" alt="Image Description">\n' +
	        '</div>\n' +
	        '</div>\n' +
	        '<h3 class="product-item__title text-blue font-weight-bold mb-3">' + title +'</h3>\n' +
	        '</a>';
	    document.getElementById("td-price-compare-" + shopName).innerHTML = '<div class="product-price">'+ price + '</div>';
	    document.getElementById("td-description-compare-" + shopName).innerHTML = description;
	}
    
}

async function getAllComparingProducts(searchCategory, searchString) {
  let ebayProducts = await getEbayProductsForComparing(
    searchCategory,
    searchString,
    1,
    numOfShowProducts
  );
  document.getElementById("popular-products-container").innerHTML +=
    ebayProducts;
  // console.log($.HSCore.components.HSSlickCarousel)

  // $(document).trigger("readyAgain");

  let amazonProducts = await getAmazonProductsForComparing(
    searchCategory,
    searchString,
    1,
    numOfShowProducts
  );
  document.getElementById("popular-products-container").innerHTML +=
    amazonProducts;
  // console.log($.HSCore.components.HSSlickCarousel)
  // $.HSCore.components.HSSlickCarousel.init("#product-carousel-Amazon");

  let walmartProducts = await getWalmartProductsForComparing(
      searchCategory,
        searchString,
        1,
        numOfShowProducts
    );
  document.getElementById("popular-products-container").innerHTML += walmartProducts;
    $.HSCore.components.HSSlickCarousel.init("#product-carousel-Ebay");
    $.HSCore.components.HSSlickCarousel.init("#product-carousel-Amazon");
    $.HSCore.components.HSSlickCarousel.init("#product-carousel-Walmart");
    $.HSCore.components.HSSlickCarousel.init("#index-carousel")
  // $(document).trigger("readyAgain");

  // let walmartProducts = getWalmartProducts(numOfShowProducts);
  //let bestbuyProducts = getBestBuyProductsForComparing(searchCategory,searchString, numOfShowProducts);
  // document.getElementById('popular-products-container').innerHTML = ebayProducts ;
  //   document.getElementById("popular-products-container").innerHTML =
  //     amazonProducts + ebayProducts;
}
