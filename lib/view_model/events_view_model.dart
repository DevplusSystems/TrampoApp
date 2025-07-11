
import 'package:flutter/material.dart';
import 'package:trampoapp/models/venue_model.dart';

import '../constants/AppConst.dart';
import '../exceptions/app_exceptions.dart';
import '../models/event_model.dart';
import '../repository/EventsRepository.dart';
import 'base_view_model.dart';

class EventsViewModel extends BaseViewModel {
  final _eventsRepository = EventsRepository();

  List<EventModel> _categoryList = <EventModel>[];

  bool isDeleted=false;
  @override

  setDeletedValue(bool delete){
    isDeleted = delete;
    notifyListeners();
  }

  getDeletedValue(){
    return isDeleted;
  }

  setCategoryList(List<EventModel> categoryList) {
    _categoryList = categoryList;
    notifyListeners();
  }

  List<EventModel> getCategoryList() {
    return _categoryList;
  }

  clearCategoryList(){
    _categoryList.clear();
    deleteAllCategories();
    notifyListeners();
  }

  Future<void> callCategoryList() async {

    isLoading =true;
    /*_categoryRepository.getCategoryList().then((catList) {
      setCategoryList(catList);
    });*/

    try {
      final catList = await _eventsRepository.getRecipeList(1);
      setCategoryList(catList);
    } catch (e) {
      if (e is AppException) {
        errorMessage =e.toString();
        debugPrint("AppException: $e");
      } else {
        errorMessage=AppConst.someThingWentWrong;
        debugPrint("AppException: $e");

      }
    } finally {
      isLoading =false;
    }

    notifyListeners();

  }

   void deleteAllCategories()  {

    /*_eventsRepository.deleteCategories().then((deleted) {
      setDeletedValue  (deleted == 0) ? false : true ;
    });*/

  }
}
