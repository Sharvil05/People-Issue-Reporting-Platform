enum UserRole { citizen, admin }

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  // Factory methods for future Firebase integration
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      role: map['role'] == 'admin' ? UserRole.admin : UserRole.citizen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role == UserRole.admin ? 'admin' : 'citizen',
    };
  }
}
