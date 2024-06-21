class NetworkNode {
  final String id;
  final String label;

  NetworkNode({
    required this.id,
    required this.label,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NetworkNode &&
      other.id == id &&
      other.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}

class NetworkEdge {
  final String fromId;
  final String toId;

  NetworkEdge({
    required this.fromId,
    required this.toId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NetworkEdge &&
      other.fromId == fromId &&
      other.toId == toId;
  }

  @override
  int get hashCode => fromId.hashCode ^ toId.hashCode;
}