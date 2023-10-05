// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? credits;
  final String? cookie;

  @override
  String toString() => 'User Created Succesfully';

  User({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.credits,
    this.cookie,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? credits,
    String? cookie,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      credits: credits ?? this.credits,
      cookie: cookie ?? this.cookie,
    );
  }
}
