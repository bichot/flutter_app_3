import 'package:flutter_app_3/Place/model/place.dart';
import 'package:flutter_app_3/User/model/user.dart';
import 'package:flutter_app_3/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
      Future<void> updatePlaceDate(Place place) => _cloudFirestoreAPI.updatePlaceDate(place);
}
