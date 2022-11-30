# How to update blackout dates using onViewChanged callback in the Flutter Calendar?

A quick-start example to update blackout dates using onViewChanged callback in the Flutter Calendar.

In the Flutter Event Calendar, you can update the [blackoutDates](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/SfCalendar/blackoutDates.html) by using [onViewChanged](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/SfCalendar/onViewChanged.html) callback of the calendar. Using this, You can disable the interaction for a certain date in the month view and timeline month view of the calendar.

You can obtain the days that are currently visible for the month using the onViewChanged function, and then add the desired dates to the _blackoutDateCollection variable and assign _blackoutDates to the calendar's blackoutdates property.

You can also refer our UG documentation to know more about [blackoutDates](https://help.syncfusion.com/flutter/calendar/month-view#blackout-dates).

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).