// To parse this JSON data, do
//
//     final getAppointmentM = getAppointmentMFromMap(jsonString);

import 'dart:convert';

class GetAppointmentM {
  GetAppointmentM({
    this.the0,
    this.appointments,
  });

  int the0;
  List<Appointment> appointments;

  factory GetAppointmentM.fromJson(String str) => GetAppointmentM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAppointmentM.fromMap(Map<String, dynamic> json) => GetAppointmentM(
    the0: json["0"],
    appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "0": the0,
    "appointments": List<dynamic>.from(appointments.map((x) => x.toMap())),
  };
}

class Appointment {
  Appointment({
    this.id,
    this.customerId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int customerId;
  DateTime date;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Appointment.fromJson(String str) => Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    customerId: json["customer_id"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
  Map<String, dynamic> toMap() => {
    "id": id,
    "customer_id": customerId,
    "date": date.toIso8601String(),
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
