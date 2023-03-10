$(document).on('ready', function () {
    $('footer').load(baseAdminPathName + "/include/footer.html");

});
var adminEmail = window.localStorage.getItem('pricechecker-admin-name');
if(adminEmail === null || adminEmail === ''){
    window.location.href = baseAdminPathName + '/authentications/login.html';
}else {
    var adminName = document.getElementsByClassName('admin-name')[0];
    adminName.innerText = adminEmail;
    // var textNode = document.createTextNode(adminEmail);
    // adminName.appendChild(textNode);
}