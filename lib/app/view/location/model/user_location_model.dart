class UserLocationModel {
  String? country;
  String? state;
  String? city;

  UserLocationModel({
    this.country,
    this.state,
    this.city,
  });

  @override
  String toString() {
    return 'Country: $country, State: $state, City: $city';
  }
}
