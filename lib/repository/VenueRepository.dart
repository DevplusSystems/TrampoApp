
import 'package:flutter/cupertino.dart';
import 'package:trampoapp/models/venue_model.dart';
import '../network/base_api_services.dart';
import '../network/network_api_services.dart';

class VenueRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

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
