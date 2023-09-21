class MenuModel {
  int? menuId;
  String? menuName;

  MenuModel({
    this.menuId,
    this.menuName,
  });

  MenuModel.fromJson(Map<String, dynamic> json) {
    menuId = json['menu_id'];
    menuName = json['menu_name'];
  }
}
