class User {
  String id;
  String name;

  User(this.id, this.name);

  @override
  String toString() {
    return "User: $name | ID: $id";
  }
}