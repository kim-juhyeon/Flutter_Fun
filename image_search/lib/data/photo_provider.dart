import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';

// InheritedWidget은 어떤 위젯트리에도 원한 객체를 전달해 줄 수 있는 위젯입니다.
class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  const PhotoProvider({Key? key, required this.api, required Widget child})
      : super(key: key, child: child);

  static PhotoProvider of(BuildContext context){ //위젯트리의 정보를 가지고 있는 객체
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>(); // 가장 가까운 PhotoProvider를 찾아서 return
    assert(result != null,'No PixabayApi found in context'); //null 이면 문구가 나옵니다. 널이 아니다라는 검증
    return result!;
  }

  @override //이전 상태와 현재 상태가 다른지 확인하는 위젯
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
