import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
   required this.createdAt,
    required this.name,
    required  this.avatar,
    required   this.email,
    required this.phone,
    required this.department,
    required this.birthday,
    required this.country,
    required this.id,
  });

  DateTime createdAt;
  String name;
  String avatar;
  String email;
  String phone;
  List<Department> department;
  DateTime birthday;
  String country;
  String id;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    email: json["email"],
    phone: json["phone"],
    department: List<Department>.from(json["department"].map((x) => departmentValues.map[x])),
    birthday: DateTime.parse(json["birthday"]),
    country: json["country"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "email": email,
    "phone": phone,
    "department": List<dynamic>.from(department.map((x) => departmentValues.reverse[x])),
    "birthday": birthday.toIso8601String(),
    "country": country,
    "id": id,
  };
}

enum Department { A, B, C }

final departmentValues = EnumValues({
  "a": Department.A,
  "b": Department.B,
  "c": Department.C
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
