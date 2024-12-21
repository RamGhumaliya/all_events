class CategoryModel {
  final String category;
  final String data;

  CategoryModel({required this.category, required this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category: json['category'],
      data: json['data'],
    );
  }
}
