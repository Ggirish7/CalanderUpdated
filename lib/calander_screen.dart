// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:calanderupdated/appointment_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'appoitments.dart';

class CalanderScreen extends GetView<ApppointmentController> {
  const CalanderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ApppointmentController);
    Appointments appointments = Appointments();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              scrollable: false,
              title: Center(child: Text("Add Event")),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: appointments.labelController,
                      onChanged: (value) {
                        appointments.label.value = value;
                      },
                      decoration: InputDecoration(hintText: "Label"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay pickedStartTime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ))!;
                        appointments.setStartTime(pickedStartTime);
                      },
                      child: Text("Set Start Time"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay pickedEndTime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ))!;
                        appointments.setEndTime(pickedEndTime);
                      },
                      child: Text("Set End Time"),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    appointments.addMeetings();
                    appointments.labelController.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Submit"),
                ),
              ],
            );
          },
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.week,
          dataSource: MeetingDataSource(
            appointments.getAppointments(),
          ),
        ),
      ),
    );
  }
}
