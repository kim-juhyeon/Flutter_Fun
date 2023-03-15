import 'package:dust_check/const/status_level.dart';
import 'package:dust_check/model/stat_model.dart';
import 'package:dust_check/model/status_models.dart';

class DataUtils {
  static String getTimeFromDateTime({required DateTime dateTime}) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${getTimeFormat(dateTime.hour)}:${getTimeFormat(dateTime.minute)}';
  }

  static String getTimeFormat(int number) {
    return number.toString().padLeft(2, '0'); //dateTime - 숫자가 2보다 작으면 0을 채움
  }

  static String getUnitFromItemCode({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '㎍/㎥ ';

      case ItemCode.PM25:
        return '㎍/㎥ ';

      default:
        return 'ppm';
    }
  }

//item code 를 한글로 번역된 것을 받을 수 있음
  static String itemCodeKrString({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';

      case ItemCode.NO2:
        return '이산화질소';

      case ItemCode.O3:
        return '오존';

      case ItemCode.CO:
        return '일산화탄소';
      case ItemCode.SO2:
        return '아황산가스';
    }
  }

//해당 로직은 기존에 서울 dustcode로만 판단하는 로직을 구성하였으나,
// 해당 로직은 따로 비교할 필요가 없는 로직이다.
  static StatusModel getCurrentStatusFromStat({
    required double value,
    required ItemCode itemCode,
  }) {
    return statusLevel.where((status) {
      if (itemCode == ItemCode.PM10) {
        return status.minFineDust < value;
      } else if (itemCode == ItemCode.PM25) {
        return status.minUltraFineDust < value;
      } else if (itemCode == ItemCode.CO) {
        return status.min03 < value;
      } else if (itemCode == ItemCode.O3) {
        return status.min03 < value;
      } else if (itemCode == ItemCode.NO2) {
        return status.minNO2 < value;
      } else if (itemCode == ItemCode.SO2) {
        return status.minSO2 < value;
      } else {
        throw Exception('알수없는 ItemCode입니다.');
      }
    }).last;
  }
}
