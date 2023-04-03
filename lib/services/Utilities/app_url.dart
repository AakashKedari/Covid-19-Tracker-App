import 'dart:core';

class AppUrl {
  //this is our base url
  static const baseUrl = "https://disease.sh/v3/covid-19/";

  // fetch world covid states
  static const worldStateApi = baseUrl + 'all';
  static const countriesList = baseUrl + 'countries';
}
