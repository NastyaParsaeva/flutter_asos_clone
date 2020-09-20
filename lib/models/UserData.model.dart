class UserData {
  final String firstName;
  final String lastName;

  UserData({this.firstName, this.lastName});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return json == null
        ? null
        : UserData(
            firstName: json['first'],
            lastName: json['last'],
          );
  }
}
