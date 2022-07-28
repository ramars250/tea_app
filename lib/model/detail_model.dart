//建立要推送的DetailItem模型
class DetailItems {
  final String orderName;
  final String title;
  final String cupSize;
  final String iceCube;
  final String sweet;

  // final String feed;
  DetailItems(
      this.orderName, this.title, this.cupSize, this.iceCube, this.sweet);
}
//建立包含DetailItem模型的列表
class DetailList {
  List<DetailItems> detailList;

  DetailList(this.detailList);
}