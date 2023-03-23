import 'package:book_list/screens/list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
/*main() 함수는 Dart 프로그램의 진입점입니다. 
모든 Flutter 앱은 Dart로 작성되기 때문에, 앱의 진입점인 main() 함수는 반드시 작성되어야 합니다. main() 함수는 앱을 실행하는 코드를 포함하며, 
일반적으로 runApp() 함수를 호출하여 앱의 시작점을 설정합니다.
runApp() 함수는 Flutter 위젯을 렌더링하고, 렌더링된 위젯을 디바이스 화면에 배치합니다. 
이 함수는 최상위 위젯을 인수로 받아 앱을 실행합니다. 이 최상위 위젯은 모든 하위 위젯을 포함하는 루트 위젯이 됩니다. 
runApp() 함수는 이 최상위 위젯을 렌더링하고 앱을 시작합니다.
즉, main() 함수는 Dart 프로그램의 진입점이며, runApp() 함수는 앱의 시작점을 설정하여 최상위 위젯을 렌더링하고 앱을 실행합니다.*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/*   BuildContext 인수는 위젯의 위치와 구성 정보를 포함하는 객체입니다. 
이 인수를 통해 위젯은 Theme, MediaQuery, Navigator 등 다른 위젯과 애플리케이션의 상태 정보를 액세스 할 수 있습니다.
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Book List App",
      home: ListScreen(),
    );
  }
}
