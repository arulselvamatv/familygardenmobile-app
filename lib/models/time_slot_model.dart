class TimeSlotsModel {
  List<TimeSlots>? timeSlots;
  String? logged;

  TimeSlotsModel({this.timeSlots, this.logged});

  TimeSlotsModel.fromJson(Map<String, dynamic> json) {
    if (json['time_slots'] != null) {
      timeSlots = <TimeSlots>[];
      json['time_slots'].forEach((v) {
        timeSlots!.add(new TimeSlots.fromJson(v));
      });
    }
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timeSlots != null) {
      data['time_slots'] = this.timeSlots!.map((v) => v.toJson()).toList();
    }
    data['logged'] = this.logged;
    return data;
  }
}

class TimeSlots {
  String? timeSlotId;
  String? startTime;
  String? endTime;
  String? comment;
  String? slotOrderCount;

  TimeSlots(
      {this.timeSlotId,
        this.startTime,
        this.endTime,
        this.comment,
        this.slotOrderCount});

  TimeSlots.fromJson(Map<String, dynamic> json) {
    timeSlotId = json['time_slot_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    comment = json['comment'];
    slotOrderCount = json['slot_order_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_slot_id'] = this.timeSlotId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['comment'] = this.comment;
    data['slot_order_count'] = this.slotOrderCount;
    return data;
  }
}
