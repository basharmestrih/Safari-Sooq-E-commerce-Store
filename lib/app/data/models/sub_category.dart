// models/sub_category_model.dart

class SubCategoryModel {
  final int id;
  final String categoryNameArabic;
  final String nameArabic;
  final String nameEnglish;
  final String descriptionArabic;
  final String descriptionEnglish;
  final String image;
  final int order;
  final int proirety;
  final int code;
  final int productsCount;
  final String useType; 
  final int categoryId;

  SubCategoryModel( {
    required this.id,
    required this.categoryNameArabic,
    required this.nameArabic,
    required this.nameEnglish,
    required this.descriptionArabic,
    required this.descriptionEnglish,
    required this.image,
    required this.order,
    required this.proirety,
    required this.code,
    required this.productsCount,
    required this.useType,
    required this.categoryId,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      categoryNameArabic: json['categoryNameArabic'] ?? '',
      nameArabic: json['nameArabic'] ?? '',
      nameEnglish: json['nameEnglish'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
      descriptionEnglish: json['descriptionEnglish'] ?? '',
      image: json['image'] ?? '',
      order: json['order'] ?? 0,
      proirety: json['order'] ?? 0,
      code: json['order'] ?? 0,
      productsCount: json['productsCount'] ?? 0,
      useType: json['useType'] ?? '',
      categoryId: json['categoryId'] ?? 0,
    );
  }
}
