class Country {
  String? name;
  String? region;
  int? population;
  String? flag;

  Country({this.name, this.region, this.population, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    population = json['population'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['population'] = this.population;
    data['flag'] = this.flag;
    return data;
  }
}