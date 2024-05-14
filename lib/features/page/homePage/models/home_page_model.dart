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
}
