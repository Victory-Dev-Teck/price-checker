async function getAmazonProductsFromApi(searchCategory, searchString, maxNumberOfProducts) {
    let retArray = [];
    let retData = {};
    let url = '';
    if (searchString) {
        url = "https://amazon23.p.rapidapi.com/product-search?query=" + searchString + "&country=US"
    } else {
        url = "https://amazon23.p.rapidapi.com/product-search?query=laptop&country=US"
    }

    return new Promise((resolve, reject) => {

        $.ajax({
            "async": true,
            "crossDomain": true,
            "url": url,
            "method": "GET",
            "headers": {
                "X-RapidAPI-Key": "264d6a643bmshe4d1dae958ff50fp1b9242jsnf46f9c07e405",
                "X-RapidAPI-Host": "amazon23.p.rapidapi.com"
            },
            success: function (response) {

                var myJsonString = JSON.stringify(response);

                let respBuff = JSON.parse(myJsonString);

                retArray = convertAmazonResponseForUI(respBuff, 'Amazon');
                retData['error'] = "ok";

                retData['data'] = retArray;
                return resolve(retData);
            },
            fail: function (response, textStatus) {
                retData['error'] = 'Status is ' + textStatus + '\n Response is ' + response.toString();
                return reject(retData);
            }
        });
    });
}
function convertAmazonResponseForUI(response, eshop, currentPage, numberInPage) {
    console.log(response, eshop, currentPage, numberInPage);
    let retArray = [];
    let resp = response['result'];
    let respLen = resp.length;
    let startIndex = 0;
    if(currentPage > 0){
        startIndex = currentPage * numberInPage;
    }
    let endIndex = numberInPage *( currentPage + 1);
    if(startIndex > respLen - 1){
        startIndex = respLen - 11;
        if(startIndex < 0) startIndex = 0;
        endIndex = respLen;
    }
    if(endIndex > respLen - 1){
        endIndex = respLen;
    }
    if(respLen > 0){
        for(let i = startIndex; i < endIndex; i ++){
            let row = resp[i];
            let buff = {};
            buff['title'] = row['title'];
            buff['description'] = row['title'];
            buff['product_url'] = row['url'];
            buff['image_url'] = row['thumbnail'];
            buff['price'] = row['price']['current_price'] + row['price']['currency'];
            buff['eshop'] = eshop;
            retArray.push(buff);
        }
    }
    return retArray;
}