import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registerapp/models/network/network_model.dart';
import 'package:registerapp/repositories/network/network_repo.dart';

class FirebaseNetworkRepository implements NetworkRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String usersCollection = 'users';
  static const String networkCollection = 'network';

  @override
  Future<List<NetworkNode>> fetchNetwork(String userId) async {
    try {
      List<NetworkNode> network = [];
      QuerySnapshot snapshot = await _firestore.collection(networkCollection).doc(userId).collection('nodes').get();
      network.addAll(snapshot.docs.map((doc) => NetworkNode(
        id: doc.id,
        label: doc['label'],
      )));
      return network;
    } catch (e) {
      throw Exception('Failed to load network: $e');
    }
  }

  @override
  Future<bool> updateNetwork(String userId, List<NetworkNode> network) async {
    try {
      var batch = _firestore.batch();
      network.forEach((node) {
        batch.set(_firestore.collection(networkCollection).doc(userId).collection('nodes').doc(node.id), {
          'label': node.label,
        });
      });
      await batch.commit();
      return true;
    } catch (e) {
      throw Exception('Failed to update network: $e');
    }
  }  
}