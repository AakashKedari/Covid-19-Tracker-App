class CountryStats {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CountryStats(
      {this.updated,
      this.country,
      this.countryInfo,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  CountryStats.fromJson(Map<String, dynamic> json) {
    updated = json["updated"];
    country = json["country"];
    countryInfo = json["countryInfo"] == null
        ? null
        : CountryInfo.fromJson(json["countryInfo"]);
    cases = json["cases"];
    todayCases = json["todayCases"];
    deaths = json["deaths"];
    todayDeaths = json["todayDeaths"];
    recovered = json["recovered"];
    todayRecovered = json["todayRecovered"];
    active = json["active"];
    critical = json["critical"];
    casesPerOneMillion = json["casesPerOneMillion"];
    deathsPerOneMillion = json["deathsPerOneMillion"];
    tests = json["tests"];
    testsPerOneMillion = json["testsPerOneMillion"];
    population = json["population"];
    continent = json["continent"];
    oneCasePerPeople = json["oneCasePerPeople"];
    oneDeathPerPeople = json["oneDeathPerPeople"];
    oneTestPerPeople = json["oneTestPerPeople"];
    activePerOneMillion = json["activePerOneMillion"];
    recoveredPerOneMillion = json["recoveredPerOneMillion"];
    criticalPerOneMillion = json["criticalPerOneMillion"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["updated"] = updated;
    _data["country"] = country;
    if (countryInfo != null) {
      _data["countryInfo"] = countryInfo?.toJson();
    }
    _data["cases"] = cases;
    _data["todayCases"] = todayCases;
    _data["deaths"] = deaths;
    _data["todayDeaths"] = todayDeaths;
    _data["recovered"] = recovered;
    _data["todayRecovered"] = todayRecovered;
    _data["active"] = active;
    _data["critical"] = critical;
    _data["casesPerOneMillion"] = casesPerOneMillion;
    _data["deathsPerOneMillion"] = deathsPerOneMillion;
    _data["tests"] = tests;
    _data["testsPerOneMillion"] = testsPerOneMillion;
    _data["population"] = population;
    _data["continent"] = continent;
    _data["oneCasePerPeople"] = oneCasePerPeople;
    _data["oneDeathPerPeople"] = oneDeathPerPeople;
    _data["oneTestPerPeople"] = oneTestPerPeople;
    _data["activePerOneMillion"] = activePerOneMillion;
    _data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    _data["criticalPerOneMillion"] = criticalPerOneMillion;
    return _data;
  }
}

class CountryInfo {
  int? id;
  String? iso2;
  String? iso3;
  int? lat;
  int? long;
  String? flag;

  CountryInfo({this.id, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    iso2 = json["iso2"];
    iso3 = json["iso3"];
    lat = json["lat"];
    long = json["long"];
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["iso2"] = iso2;
    _data["iso3"] = iso3;
    _data["lat"] = lat;
    _data["long"] = long;
    _data["flag"] = flag;
    return _data;
  }
}
