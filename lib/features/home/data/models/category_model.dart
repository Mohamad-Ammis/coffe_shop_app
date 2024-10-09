class CategoryModel {
  final dynamic id;
  final String name;

  CategoryModel({required this.id,required this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], id: json['id']);
  }
}
