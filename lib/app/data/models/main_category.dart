// models/category.dart

class Category {
  final String nameArabic;
  final String nameEnglish;
  final String descriptionArabic;
  final String descriptionEnglish;
  final String image; 
  final int order;
  final int subCategoriesCount;
  final int productsCount;
  final int proirety;
  final int pageIndex;
  final int pageSize;
  final int totalCount;

  Category({
    required this.nameArabic,
    required this.nameEnglish,
    required this.descriptionArabic,
    required this.descriptionEnglish,
    required this.image,
    required this.order,
    required this.subCategoriesCount,
    required this.productsCount,
    required this.proirety,
    required this.pageIndex,
    required this.pageSize,
    required this.totalCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      nameArabic: json['nameArabic'] ?? '',
      nameEnglish: json['nameEnglish'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
      descriptionEnglish: json['descriptionEnglish'] ?? '',
      image: json['image'] ?? '',
      order: json['order'] ?? 0,
      subCategoriesCount: json['subCategoriesCount'] ?? 0,
      productsCount: json['productsCount'] ?? 0,
      proirety: json['proirety'] ?? 0,
      pageIndex: json['pageIndex'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
