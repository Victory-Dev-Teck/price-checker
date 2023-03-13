async function getWalmartFromApi(searchCategory, searchString, currentPage, maxNumberOfProducts){
    let retArray = [];
    let retData = {};
    let url = '';
    if(searchString === ''){
        searchString = 'laptop';
    }
    return new Promise((resolve, reject) => {
        $.ajax({
        "async" : true,
        "crossDomain" : true,
        "method" : "GET",
        url : 'https://api.bluecartapi.com/request?api_key=3C494B3DB5A4459F885679B53BF32ECE&search_term=' + searchString + '&type=search',
        headers:{
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        },
        success: function (response) {

            var myJsonString = JSON.stringify(response);
            let respBuff = JSON.parse(myJsonString);

            retArray = convertWalmartResponseForUI(respBuff['search_results'], 'Walmart', currentPage, maxNumberOfProducts);
            retData['error'] = "ok";

            retData['data'] = retArray;
            return resolve(retData);

        },
        fail: function (response, textStatus) {
            retData['error'] = 'Status is ' + textStatus + '\n Response is ' + response.toString();
            return reject(retData);
        }
    });
})  ;
}
function convertWalmartResponseForUI(response, eshop, currentPage, numberInPage) {
    console.log(response, eshop, currentPage, numberInPage);
    let retArray = [];

    let respLen = response.length;
    let startIndex = 0;
    if (currentPage > 0) {
        startIndex = currentPage * numberInPage - 1;
    }
    let endIndex = numberInPage * (currentPage + 1);
    if (startIndex > respLen - 1) {
        startIndex = respLen - 11;
        if(startIndex < 0) startIndex = 0;
        endIndex = respLen;
    }
    if (endIndex > respLen - 1) {
        endIndex = respLen;
    }
    let startPrice = parseFloat(window.localStorage.getItem('price-filter-start'));
    let endPrice = parseFloat(window.localStorage.getItem('price-filter-end'));
    if (respLen > 0) {
        for (let i = 0; i < respLen; i++) {
            let row = response[i]['product'];
            let buff = {};
            buff['title'] = row['title'];
            buff['description'] = row['description'];
            buff['product_url'] = row['link'];
            buff['image_url'] = row['main_image'];
            buff['price'] = "$" + response[i]['offers']['primary']['price'];
            buff['eshop'] = eshop;

            let price_buff = parseFloat(response[i]['offers']['primary']['price']);
            if(startPrice === -1){
                retArray.push(buff);
            }else if(startPrice === -1000){
                if(price_buff > 1000){
                    retArray.push(buff);
                }
            }else {
                if ((startPrice <= price_buff) && (price_buff <= endPrice)) {
                    retArray.push(buff);
                }
            }
        }
        if((0 < retArray.length) && (retArray.length < 4)){
            let index = 0;
            for(let i = retArray.length; i < 4; i ++){
                retArray.push(retArray[index]);
                index ++;
            }
        }
    }
    return retArray;
}
