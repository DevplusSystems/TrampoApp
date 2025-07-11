

import 'package:trampoapp/services/api_service.dart';

import '../models/event_model.dart';

class EventsRepository {
  final ApiService _baseApiServices = ApiService();

  Future<List<EventModel>> getRecipeList(categoryId) async {
    List<EventModel> recipeList = <EventModel>[];

    if (recipeList.isEmpty) {

    }

    return recipeList;
  }

  Future<EventModel?> getEventsDetail(EventModel events) async {
    Map categoryMap = {
      "id": events.id,
    };
    return null;

  }

}
