import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // latitude - 위도 , longitude -경도
  //구글 맵에서 제공
  static LatLng companyLatLng = LatLng(
    37.5233273,
    126.921252,
  );
  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15,
  );
  static const double okDistance = 100; //CameraPosition 위젯안에 초기 포지션값을 삽임한다.
  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5),
    //radius 반경 (미터)
    radius: okDistance,
    strokeColor: Colors.blue,
    strokeWidth: 1,
  );
  static final Circle notwithinDistanceCircle = Circle(
    circleId: CircleId('notwithinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.red.withOpacity(0.5),
    //radius 반경 (미터)
    radius: okDistance,
    strokeColor: Colors.red,
    strokeWidth: 1,
  );
  static final Circle checkDoneCircle = Circle(
    circleId: CircleId('checkDoneCircle'),
    center: companyLatLng,
    fillColor: Colors.green.withOpacity(0.5),
    //radius 반경 (미터)
    radius: okDistance,
    strokeColor: Colors.green,
    strokeWidth: 1,
  );
  static final Marker marker = Marker(
    //서클안에 마커를 표시
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
        // future 파라미터에는 future를 보내는 어떤 함수든 넣을 수 있다.
        // checkPermisson함수의 상태가 변경 될 때마다. builder를 다시 실행하게 된다.
        future: checkPermission(),
        //FutureBuilder의 경우에는 builder 함수를 두개 받는다.
        //snapshot으로 sheckPermisson의 return값을 받아 올 수 있음.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 로딩 상태일때 조건을 걸어야 합니다.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return StreamBuilder<Position>(
                stream: Geolocator.getPositionStream(),
                //getPostionStream은 포지션이 바뀔때마다 바뀐다.
                builder: (context, snapshot) {
                  bool isWithinRange = false;
                  //현재 위치가 테두리안에 있는지 없는지 bool 값으로 정리 flase는 기본값

                  if (snapshot.hasData) {
                    final start = snapshot.data!;
                    //현재위치를 start로 저장
                    final end = companyLatLng;
                    // 회사 위치
                    // geolocator를 이용하여 거리계산을 한다.
                    final distance = Geolocator.distanceBetween(start.latitude,
                        start.longitude, end.latitude, end.longitude);
                    if (distance < okDistance) {
                      isWithinRange = true;
                    }
                  }

                  return Column(
                    children: [
                      _CustomGoogleMap(
                        initialPosition: initialPosition,
                        circle: isWithinRange
                            // ? = true , : = flase
                            ? withinDistanceCircle
                            : notwithinDistanceCircle,
                        marker: marker,
                      ),
                      _ChoolCheckButton(
                        isWithinRange: isWithinRange,
                        onPressed: onChoolCheckPressed(),
                      ),
                    ],
                  );
                });
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  onChoolCheckPressed() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('출근하기'),
            content: Text('출근을 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('취소'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('출근하기'),
              ),
            ],
          );
        });
  }

  Future<String> checkPermission() async {
    //권환과 관련된 작업은 async 유저가 권환을 허락 or 거절할 때까지 기다려야 하므로
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    //location 서비스가 활성화가 되어 있는지 확인하는 버튼
    if (!isLocationEnabled) {
      //위치 서비스가 꺼져있을경우
      return '위치 서비스를 활성화 해주세요.';
    }
    LocationPermission checkedPermission = await Geolocator.checkPermission();
    // checkPermisson : 현재 내 위치에 대한 권환을 가져오는 것
    // 가저오는 형태는 LocationPermission
    //LocationPermisson이 denied일 경우 사용자에게 재요청이 가능
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission == await Geolocator.requestPermission();
      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
        //처음 요청 했는데도 denied일 경우 재요청을 진행
      }
    }
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅해서 허가해주세요.';
      // 아직도 denied라고 판단하여 사용자 상태는 deniedForever 으로 판단하여 직접 세팅해달라고 요구
    }
    //위 if에 포함되어 있지 않다면 위치 권한은 허가 되었음
    return '위치 권한이 허가 되었습니다.';
  }

  AppBar renderAppBar() {
    return AppBar(
      title: Text('오늘 또 출근',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          )),
      backgroundColor: Colors.white,
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;

  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
    required this.marker,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: {circle},
        markers: {marker}, // 내 위치 표시
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  final bool isWithinRange;
  final voidCallback onPressed;
  const _ChoolCheckButton(
      {required this.isWithinRange, required this.onPressed, Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timelapse_outlined,
            size: 50.0,
            color: isWithinRange ? Colors.blue : Colors.red,
          ),
          SizedBox(
            height: 20.0,
          ),
          if (isWithinRange)
            //범위안에 있을경우에만 출근하기 버튼이 활성화 되는 로직
            TextButton(onPressed: onPressed, child: Text('출근하기'))
        ],
      ),
    );
  }
}
