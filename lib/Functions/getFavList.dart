// ignore_for_file: file_names

import 'package:hikeme/Objects/event_obj.dart';

List<EventObj> getFavs(
    {required List<EventObj> eventsList, required List<int> favsId}) {
  List<EventObj> favs = [];
  for (var id in favsId) {
    for (var event in eventsList) {
      event.groupId == id ? favs.add(event) : null;
    }
  }
  return favs;
}
