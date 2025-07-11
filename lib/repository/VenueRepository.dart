
import 'package:flutter/cupertino.dart';
import 'package:trampoapp/models/venue_model.dart';
import 'package:trampoapp/services/api_service.dart';

class VenueRepository {
  final ApiService _baseApiServices = ApiService();

  Future<List<VenueModel>> getCategoryList() async {
    List<VenueModel> categoryList = <VenueModel>[];


    if (categoryList.isEmpty) {

    }

    return categoryList;
  }

  Future<int> deleteCategories() async {
    return 0;
  }


}
