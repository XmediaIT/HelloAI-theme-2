(function () {
  document.querySelectorAll('.edsmm_itemContainer[aria-expanded]').forEach(function (link) {
    link.addEventListener('click', function () {
      var expanded = link.getAttribute('aria-expanded') === 'true';
      link.setAttribute('aria-expanded', expanded ? 'false' : 'true');
    });
  });
})();
