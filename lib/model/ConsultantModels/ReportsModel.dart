class RebortsModel {
  int totalConsultants;
  int totalAmount;
  List<AllEndedReservations> allEndedReservations;

  RebortsModel({this.totalConsultants, this.totalAmount, this.allEndedReservations});

  RebortsModel.fromJson(Map<String, dynamic> json) {
    totalConsultants = json['total_consultants'];
    totalAmount = json['total_amount'];
    if (json['all_ended_reservations'] != null) {
      allEndedReservations = new List<AllEndedReservations>();
      json['all_ended_reservations'].forEach((v) {
        allEndedReservations.add(new AllEndedReservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_consultants'] = this.totalConsultants;
    data['total_amount'] = this.totalAmount;
    if (this.allEndedReservations != null) {
      data['all_ended_reservations'] =
          this.allEndedReservations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllEndedReservations {
  int id;
  int consultantId;
  int clientId;
  int appointmentId;
  String type;
  String status;
  int cost;
  String from;
  String to;
  String createdAt;
  String updatedAt;

  AllEndedReservations(
      {this.id,
        this.consultantId,
        this.clientId,
        this.appointmentId,
        this.type,
        this.status,
        this.cost,
        this.from,
        this.to,
        this.createdAt,
        this.updatedAt});

  AllEndedReservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantId = json['consultant_id'];
    clientId = json['client_id'];
    appointmentId = json['appointment_id'];
    type = json['type'];
    status = json['status'];
    cost = json['cost'];
    from = json['from'];
    to = json['to'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['from'] = this.from;
    data['to'] = this.to;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}