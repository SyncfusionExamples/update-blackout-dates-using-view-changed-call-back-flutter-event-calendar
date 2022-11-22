import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(const BlackoutDates_Updation());
}

class BlackoutDates_Updation extends StatefulWidget {
  const BlackoutDates_Updation({super.key});

  @override
  BlackoutDates createState() => BlackoutDates();
}

class BlackoutDates extends State<BlackoutDates_Updation> {
  List<DateTime> _blackoutDates = <DateTime>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
            child: SfCalendar(
              view: CalendarView.month,
              dataSource: _getCalendarDataSource(),
              allowedViews: const [
                CalendarView.month,
                CalendarView.timelineMonth,
              ],
              blackoutDates: _blackoutDates,
              onViewChanged: viewChanged,
              blackoutDatesTextStyle: const TextStyle(
                  color: Colors.red, decoration: TextDecoration.lineThrough),
            ),
          )),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime(2021, 1, 25, 04, 0, 0),
      endTime: DateTime(2021, 1, 26, 01, 0, 0),
      subject: 'Meeting',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2021, 1, 26, 01, 0, 0),
      endTime: DateTime(2021, 1, 27, 03, 0, 0),
      subject: 'Planning',
      color: Colors.green,
    ));

    return _AppointmentDataSource(appointments);
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    List<DateTime> blackoutDateCollection = <DateTime>[];

    blackoutDateCollection.add(viewChangedDetails.visibleDates[0]);
    blackoutDateCollection.add(viewChangedDetails.visibleDates[1]);
    blackoutDateCollection.add(viewChangedDetails.visibleDates[2]);
    blackoutDateCollection.add(viewChangedDetails.visibleDates[3]);
    blackoutDateCollection.add(viewChangedDetails.visibleDates[4]);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates = blackoutDateCollection;
      });
    });
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}