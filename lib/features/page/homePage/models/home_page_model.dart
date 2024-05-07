class HomePageModel {
  late bool activeIconHomeFooter;
  late bool activeIconHeader;
  HomePageModel({
    required this.activeIconHeader,
    required this.activeIconHomeFooter,
  });
  HomePageModel.initial() {
    activeIconHeader = false;
    activeIconHomeFooter = false;
  }
  bool get getActiveIconHomeFooter => activeIconHomeFooter;
  bool get getActiveIconHeader => activeIconHeader;
  set setActiveIconHomeFooter(bool value) => activeIconHomeFooter = value;
  set setActiveIconHeader(bool value) => activeIconHeader = value;
}
