import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girman/features/home/data/models/person_model.dart';

class FirseBaseDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PersonDataModel>> getHomeData() async {
    try {
       final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('person').get();
    return querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            PersonDataModel.fromJson(e.data()))
        .toList();
    } catch(e) {
      throw Exception(e);
    }
  }
}