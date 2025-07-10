

import '../models/event_model.dart';
import '../network/base_api_services.dart';
import '../network/network_api_services.dart';

class EventsRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

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
