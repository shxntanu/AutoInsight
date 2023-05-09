import 'package:get/get.dart';
import '../models/previoustrip.dart';

var tripList = [
  PreviousTrip(
    start: 'katraj',
    end: 'fc road',
    distance: 45,
  ),
  PreviousTrip(
    start: 'katraj',
    end: 'fc road',
    distance: 45,
  ),
].obs;
class tripController extends GetxController {

  dynamic getTrip(index) => tripList[index];
  dynamic get getTripList => tripList;
  int get getTripCount => tripList.length;

  void addTrip(trip) {
    tripList.add(trip);
  }

  // void removeTrip(trip) {
  //   tripList.remove(trip);
  // }
}