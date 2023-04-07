class HomeService {
  static HomeService? _instance;
  HomeService._();
  static HomeService get instance {
    _instance ??= HomeService._();
    return _instance!;
  }

  Future getHomeData() async {
    try {
      // var response = await NetworkClient(Dio()).getHomeData();
      // return response;
    } catch (e) {
      return e;
    }
  }
}
