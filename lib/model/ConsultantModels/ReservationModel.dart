class ReservationModel {
  int id;
  int consultantId;
  int clientId;
  int appointmentId;
  String type;
  String status;
  int cost;
  String createdAt;
  String updatedAt;
  Client client;
  Appointment appointment;

  ReservationModel(
      {this.id,
        this.consultantId,
        this.clientId,
        this.appointmentId,
        this.type,
        this.status,
        this.cost,
        this.createdAt,
        this.updatedAt,
        this.client,
        this.appointment});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantId = json['consultant_id'];
    clientId = json['client_id'];
    appointmentId = json['appointment_id'];
    type = json['type'];
    status = json['status'];
    cost = json['cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultant_id'] = this.consultantId;
    data['client_id'] = this.clientId;
    data['appointment_id'] = this.appointmentId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    if (this.appointment != null) {
      data['appointment'] = this.appointment.toJson();
    }
    return data;
  }
}

class Client {
  int id;
  String name;

  Client({this.id, this.name});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Appointment {
  int id;
  String date;

  Appointment({this.id, this.date});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    return data;
  }
}