import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(BlackoutDates_Updation());
}

class BlackoutDates_Updation extends StatefulWidget {
  @override
  BlackoutDates createState() => BlackoutDates();
}

class BlackoutDates extends State<BlackoutDates_Updation> {
  List<DateTime> _blackoutDates;

  @override
  void initState() {
    _blackoutDates = <DateTime>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
            child: SfCalendar(
              view: CalendarView.month,
              dataSource: _getCalendarDataSource(),
              allowedViews: [
                CalendarView.month,
                CalendarView.timelineMonth,
              ],
              blackoutDates: _blackoutDates,
              onViewChanged: viewChanged,
              blackoutDatesTextStyle: TextStyle(
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
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates.add(viewChangedDetails.visibleDates[0]);
        _blackoutDates.add(viewChangedDetails.visibleDates[1]);
        _blackoutDates.add(viewChangedDetails.visibleDates[2]);
        _blackoutDates.add(viewChangedDetails.visibleDates[3]);
        _blackoutDates.add(viewChangedDetails.visibleDates[4]);
      });
    });
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
