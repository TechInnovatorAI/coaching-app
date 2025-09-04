import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String username;
  final String fullName;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.fullName,
    required this.createdAt,
  });

  // Firestore → UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      fullName: map['fullName'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  // UserModel → Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'fullName': fullName,
      'createdAt': createdAt,
    };
  }

   // Convenience method to check if user is valid
  bool get isValid => uid.isNotEmpty && email.isNotEmpty;

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, username: $username, fullName: $fullName)';
  }
}
