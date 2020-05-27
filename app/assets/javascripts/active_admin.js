//= require arctic_admin/base

var refreshRate = 10000; // milli seconds

setInterval(function() {
    var path = window.location.pathname;
    var shouldRefresh = path === '/admin/order_items' || path === '/admin/orders';

    if (shouldRefresh) { window.location.reload(); }

}, refreshRate);
