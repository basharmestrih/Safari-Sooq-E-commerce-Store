import 'package:get/get.dart';
import '../../../data/models/main_category.dart';
import '../../../data/models/sub_category.dart';
import '../services/category_service.dart';
import '../services/sub_category_service.dart';

class HomeController extends GetxController {
  final CategoryService categoryService = CategoryService();
  final SubCategoryService subCategoryService = SubCategoryService();

  //  Main categories
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  //  Subcategories
  List<SubCategoryModel> _subCategories = [];
  List<SubCategoryModel> get subCategories => _subCategories;

  //  Loading and error states
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  //  Load all main categories
  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    update(); 
    try {
      _categories = await categoryService.fetchCategories();
      print(_categories);
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    update(); 
  }

  //  Load all subcategories
  Future<void> loadSubCategories({required int categoryId}) async {
    _isLoading = true;
    _error = null;
    update();

    try {
      _subCategories = await subCategoryService.fetchSubCategories(categoryId);
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    update();
  }
}
