// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";
require("./slick");

import Raty from "raty.js";
window.raty = function (elem, opt) {
  let raty = new Raty(elem, opt);
  raty.init();
  return raty;
};

// require("chartkick")
// require("chart.js")
import Chart from "chart.js/auto";
global.Chart = Chart;

Rails.start();
// はずしたほうがいいかも
Turbolinks.start();
ActiveStorage.start();

jQuery(document).on("turbolinks:load", function () {
  $("#user_postcode").jpostal({
    postcode: ["#user_postcode"],
    address: {
      "#user_prefecture_code": "%3",
      "#user_address_city": "%4%5",
      "#user_address_street": "%6%7",
    },
  });
});
