import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    String key = dotenv.env['X_RAPID_API_KEY'] ?? "";

    final CalendarModel response =
        await NetworkClient(dio, baseUrl: AppEndpoints.dateAndQiblaBaseUrl)
            .requestGregorianforHijri(key, "01-09-1445");

    final outputDate = formatter.parse(response.data!.gregorian!.date!);
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
