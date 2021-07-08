// To parse this JSON data, do
//
//     final reservation = reservationFromMap(jsonString);

import 'dart:convert';

class Reservation {
  Reservation({
    this.reservations,
  });

  List<ReservationElement> reservations;

  factory Reservation.fromJson(String str) => Reservation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
    reservations: List<ReservationElement>.from(json["reservations"].map((x) => ReservationElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "reservations": List<dynamic>.from(reservations.map((x) => x.toMap())),
  };
}

class ReservationElement {
  ReservationElement({
    this.id,
    this.consultantId,
    this.clientId,
    this.appointmentId,
    this.type,
    this.status,
    this.cost,
    this.from,
    this.to,
    this.createdAt,
    this.updatedAt,
    this.consultant,
    this.appointment,
  });

  int id;
  int consultantId;
  int clientId;
  int appointmentId;
  String type;
  String status;
  int cost;
  dynamic from;
  dynamic to;
  DateTime createdAt;
  DateTime updatedAt;
  ConsultantM consultant;
  Appointment appointment;

  factory ReservationElement.fromJson(String str) => ReservationElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservationElement.fromMap(Map<String, dynamic> json) => ReservationElement(
    id: json["id"],
    consultantId: json["consultant_id"],
    clientId: json["client_id"],
    appointmentId: json["appointment_id"],
    type: json["type"],
    status: json["status"],
    cost: json["cost"],
    from: json["from"],
    to: json["to"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    consultant: ConsultantM.fromMap(json["consultant"]),
    appointment: Appointment.fromMap(json["appointment"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "client_id": clientId,
    "appointment_id": appointmentId,
    "type": type,
    "status": status,
    "cost": cost,
    "from": from,
    "to": to,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "consultant": consultant.toMap(),
    "appointment": appointment.toMap(),
  };
}

class Appointment {
  Appointment({
    this.id,
    this.date,
  });

  int id;
  DateTime date;

  factory Appointment.fromJson(String str) => Appointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date.toIso8601String(),
  };
}

class ConsultantM {
  ConsultantM({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory ConsultantM.fromJson(String str) => ConsultantM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultantM.fromMap(Map<String, dynamic> json) => ConsultantM(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
