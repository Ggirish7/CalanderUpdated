import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'appointment_controllers.dart';

class Appointments extends ApppointmentController {
  DateTime today = DateTime.now();
  List<Appointment> meetings = <Appointment>[];
  List<Appointment> getAppointments() {
    return meetings;
  }

  void addMeetings() {
    meetings.add(
      Appointment(
        startTime: startDayTime.value,
        endTime: endDayTime.value,
        subject: label.value,
        color: Colors.blue,
        // startTime: DateTime.now(),
        // endTime: DateTime.now().add(Duration(hours: 2)),
        // subject: "Hello",
        // color: Colors.blue,
      ),
    );
  }

  void setStartTime(TimeOfDay startTime) {
    DateTime initialstartTime = DateTime(
        today.year, today.month, today.day, startTime.hour, startTime.minute);
    startDayTime.value = initialstartTime;
  }

  void setEndTime(TimeOfDay endTime) {
    DateTime initialEndTime = DateTime(
        today.year, today.month, today.day, endTime.hour, endTime.minute);
    endDayTime.value = initialEndTime;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
