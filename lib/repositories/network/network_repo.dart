
import 'package:registerapp/models/network/network_model.dart';

abstract class NetworkRepository {
  
  Future<List<NetworkNode>> fetchNetwork(String userId);

   Future<bool> updateNetwork(String userId, List<NetworkNode> network);
}