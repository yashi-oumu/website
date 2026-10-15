(function () {
  "use strict";

  var reveals = document.querySelectorAll("[data-reveal]");

  reveals.forEach(function (el, i) {
    el.style.setProperty("--reveal-delay", String(i % 6));
  });

  var year = document.querySelector("[data-year]");
  if (year) {
    year.textContent = String(new Date().getFullYear());
  }
})();