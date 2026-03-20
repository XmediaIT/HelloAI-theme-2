(function () {
  var mobileQuery = window.matchMedia('(max-width: 991.98px)');

  function closeMobileMenu(header, toggle) {
    header.classList.remove('is-mobileMenuOpen');
    if (toggle) {
      toggle.setAttribute('aria-expanded', 'false');
    }
    header.querySelectorAll('.edsmm_hasChild.is-open').forEach(function (item) {
      item.classList.remove('is-open');
      var link = item.querySelector(':scope > span > .edsmm_itemContainer[aria-expanded]');
      if (link) {
        link.setAttribute('aria-expanded', 'false');
      }
    });
  }

  document.querySelectorAll('.eds_siteHeader').forEach(function (header) {
    var toggle = header.querySelector('.eds_mobileMenuToggle');
    if (toggle) {
      toggle.addEventListener('click', function () {
        var isOpen = header.classList.toggle('is-mobileMenuOpen');
        toggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      });
    }

    header.querySelectorAll('.edsmm_hasChild > span > .edsmm_itemContainer').forEach(function (link) {
      link.addEventListener('click', function (event) {
        if (!mobileQuery.matches) {
          return;
        }

        event.preventDefault();

        var parent = link.closest('.edsmm_hasChild');
        var isOpen = parent.classList.toggle('is-open');
        link.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      });
    });

    mobileQuery.addEventListener('change', function (event) {
      if (!event.matches) {
        closeMobileMenu(header, toggle);
      }
    });
  });
})();
