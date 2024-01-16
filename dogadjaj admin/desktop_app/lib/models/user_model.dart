class User {
  final int id;
  final String username;
  final String email;
  final String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
  });
}

final List<User> mockUsers = [
  User(
    id: 1,
    username: 'john_doe',
    email: 'john.doe@example.com',
    role: 'Adminnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn',
  ),
];
