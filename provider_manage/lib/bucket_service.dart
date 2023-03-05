import 'package:flutter/material.dart';
import 'main.dart';

class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [
    Bucket('잠자기', false), //test용 더미 데이터
  ];
  void createBucket(String job) {
    bucketList.add(Bucket(job, false));
    notifyListeners(); //모든 Consumer<BucketService>의 builder 함수 호출
  }

  void updateBucket(Bucket bucket, int index) {
    bucketList[index] = bucket;
    notifyListeners();
  }

  void deleteBucket(int index) {
    bucketList.removeAt(index);
    notifyListeners();
  }
}
