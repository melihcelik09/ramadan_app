import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:ramadan_app/app/view/ramadan_time/model/calendar_model.dart';
import 'package:ramadan_app/app/view/ramadan_time/model/countdown.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/network/network_client.dart';

int i = 0;

class CountdownService {
  Dio dio = Dio();

  Future<Countdown> requestHijriforGregorian() async {
    String year = "01-09-${1445 + i}";
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    final DateFormat outputFormatter = DateFormat("yyyy-MM-dd");

    final CalendarModel response =
        await NetworkClient(dio, baseUrl: AppEndpoints.dateAndQiblaBaseUrl)
            .requestGregorianforHijri(dotenv.env['X_RAPID_API_KEY']!, year);

    final outputDate = formatter.parse(response.data!.gregorian!.date!);
    final String formattedOutput = outputFormatter.format(outputDate);

    DateTime dt = DateTime.parse(formattedOutput);
    Duration timeDifference = dt.difference(DateTime.now());

    int days = timeDifference.inDays;
    if (days < 0) {
      i += 1;
      var newCountdown = await requestHijriforGregorian();
      return newCountdown;
    }
    int hours = timeDifference.inHours % 24;
    int minutes = timeDifference.inMinutes % 60;

    Countdown countdown =
        Countdown.fromJson({"days": days, "hours": hours, "minutes": minutes});

    return countdown;
  }
}