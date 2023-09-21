class GetDepartment {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  GetDepartment({this.message, this.data, this.status, this.code});

  GetDepartment.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Manager? manager;
  List<Employees>? employees;

  Data({this.id, this.name, this.manager, this.employees});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
    json['manager'] != null ? new Manager.fromJson(json['manager']) : null;
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (manager != null) {
      data['manager'] = manager!.toJson();
    }
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manager {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Manager(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Manager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['user_type'] = userType;
    data['department_id'] = departmentId;
    return data;
  }
}

class Employees {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;
  int? departmentId;

  Employees(
      {this.id,
        this.userCode,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.userType,
        this.departmentId});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['user_type'] = userType;
    data['department_id'] = departmentId;
    return data;
  }
}