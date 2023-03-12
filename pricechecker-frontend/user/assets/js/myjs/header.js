let currentUser = window.localStorage.getItem('pricechecker-user-name');
let userMenu = document.getElementById('user-menu');
let homeElm = document.getElementById("nav-home-li");
let wishElm = document.getElementById("nav-fav-li");
let profileElm = document.getElementById("nav-profile-li");
let productsElm = document.getElementById("nav-myproduct-li")
let auth = document.getElementById('authentication');
if(currentUser){
    //show current user name side of right side bar.'<i class="ec ec-user mr-1"></i> Register <span class="text-gray-50">or</span> Sign in'

    auth.innerHTML = '<i class="ec ec-user mr-1"></i> Logout  :  ' + currentUser;
    auth.setAttribute('href', '/pricechecker-frontend/user/authentications/logout-user.html');

    homeElm.setAttribute("style", "visibility:visible;");
    profileElm.setAttribute("style", "visibility:visible;");
    productsElm.setAttribute("style", "visibility:visible;");
    wishElm.setAttribute("style", "visibility:visible;");
}else {
    auth.innerHTML = '<i class="ec ec-user mr-1"></i> Register <span class="text-gray-50">or</span> Sign in';
    auth.setAttribute('href', '/pricechecker-frontend/user/authentications/login-user.html');

    homeElm.setAttribute("style", "visibility:collapse;");
    profileElm.setAttribute("style", "visibility:collapse;");
    productsElm.setAttribute("style", "visibility:collapse;");
    wishElm.setAttribute("style", "visibility:collapse;")
}
function onClickedSearch(){
    let searchVal = document.getElementById('search-product').value;
    let searchCategory = "ALL";
    window.localStorage.setItem('pricechecker-search-string', searchVal);
    window.localStorage.setItem('pricechecker-search-category', searchCategory);
    let curren_url = window.location.href;
    if(checkExistOrNot(curren_url, "compare")){
        window.location.href = baseUserPathName + '/compare.html';
    }else {
        window.location.href = baseUserPathName + '/index.html';
    }
}
function onClickedFavs(){
    if(currentUser){
        window.location.href = baseUserPathName + '/authorized/favourites.html';
    }else {
        window.console.log("You should login!");
    }
}
function onClickedHome(){
    if(currentUser){
        window.location.href = baseUserPathName + '/authorized/home.html';
    }else {
        window.console.log("You should login!");
    }
}
function onClickedTrackNav(){
    if(currentUser){
        window.location.href = baseUserPathName + '/authorized/track-products.html';
    }else {
        window.console.log("You should login!");
    }
}
function onClickedRecent(){
    if(currentUser){
        window.location.href = baseUserPathName + '/authorized/visited-product.html';
    }else {
        window.console.log("You should login!");
    }
}
function onClickedMyProfile() {
    if(currentUser){
        window.location.href = baseUserPathName + '/authorized/user-profile.html';
    }

}