(function() {
  document.getElementById('content').style.marginBottom = window.innerHeight + 'px';

  if (navigator.userAgent.indexOf('Mobile/') !== -1 && navigator.userAgent.indexOf('Safari/') !== -1) {
    document.getElementsByTagName('html')[0].className += " ios";
  }

}).call(this);
