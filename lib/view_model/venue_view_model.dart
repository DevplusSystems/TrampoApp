
import 'package:flutter/material.dart';
import 'package:trampoapp/models/venue_model.dart';

import '../constants/AppConst.dart';
import '../exceptions/app_exceptions.dart';
import '../models/event_model.dart';
import '../repository/VenueRepository.dart';
import 'base_view_model.dart';

class VenueViewModel extends BaseViewModel {
  final _venueRepository = VenueRepository();

  List<VenueModel> _venueList = <VenueModel>[];

  bool isDeleted=false;

  setDeletedValue(bool delete){
    isDeleted = delete;
    notifyListeners();
  }

  getDeletedValue(){
    return isDeleted;
  }

  setCategoryList(List<VenueModel> categoryList) {
    _venueList = categoryList;
    notifyListeners();
  }

  List<VenueModel> getCategoryList() {
    return _venueList;
  }

  clearCategoryList(){
    _venueList.clear();
    deleteAllCategories();
    notifyListeners();
  }

  Future<void> callCategoryList() async {

    setLoading(true);
    clearErrorMessage();

    /*_categoryRepository.getCategoryList().then((catList) {
      setCategoryList(catList);
    });*/

    try {
      final catList = await _venueRepository.getCategoryList();
      setCategoryList(catList);
    } catch (e) {
      if (e is AppException) {
        setErrorMessage(e.toString());
        debugPrint("AppException: $e");
      } else {
        setErrorMessage(AppConst.someThingWentWrong);
        debugPrint("AppException: $e");

      }
    } finally {
      setLoading(false);
    }

    notifyListeners();

  }

   void deleteAllCategories()  {

    /*_eventsRepository.deleteCategories().then((deleted) {
      setDeletedValue  (deleted == 0) ? false : true ;
    });*/

  }
}
