import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/ramadan_time/model/calendar_model.dart';
import 'package:ramadan_app/app/view/ramadan_time/model/countdown.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

class CountdownService {
  Dio dio = Dio();
  Future<Countdown> requestHijriforGregorian() async {
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    final DateFormat outputFormatter = DateFormat("yyyy-MM-dd");

    final response = await NetworkClient(dio,
            baseUrl: AppEndpoints.dateAndQiblaBaseUrl)
        .requestGregorianforHijri(
            "77bd26fb72mshd52097b4eaa3e06p1a44b8jsn68fc3dc01507", "01-09-1445");
    CalendarModel jsonToCalendardownModel = CalendarModel.fromJson(response);

    final outputDate =
        formatter.parse(jsonToCalendardownModel.data!.gregorian!.date!);
    final String formattedOutput = outputFormatter.format(outputDate);

    DateTime dt = DateTime.parse(formattedOutput);
    Duration timeDifference = dt.difference(DateTime.now());

    int days = timeDifference.inDays;
    int hours = timeDifference.inHours % 24;
    int minutes = timeDifference.inMinutes % 60;

    Countdown countdown =
        Countdown.fromJson({"days": days, "hours": hours, "minutes": minutes});

    return countdown;
  }
}
