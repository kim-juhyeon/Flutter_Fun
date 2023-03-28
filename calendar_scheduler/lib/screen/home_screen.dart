import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/tody_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    //selectedDay가 null이 될 수 없게 설정
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: renderFloatingActionButton(),
        body: SafeArea(
          child: Column(
            children: [
              Calendar(
                selectedDay: selectedDay,
                focuseDay: focusedDay,
                onDaySelected: OnDaySelected,
              ),
              SizedBox(
                height: 8.0,
              ),
              TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
              SizedBox(
                height: 8.0,
              ),
              _ScheduleList(),
            ],
          ),
        ));
  }

  FloatingActionButton renderFloatingActionButton() {
    //코드의 간소화를 위해 floatingActionButton의 경우도 위젯으로 생성함
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          /*showmodalBottonSheet +클릭시 올라오는 범위가 절반가량 올라오는데, 
          isScrollControlled 하면 절반 이상 올라올 수 있게 할 수 있다.*/
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBottomSheet();
          },
        );
      },
      backgroundColor: PRIMAY_COLOR,
      child: Icon(
        Icons.add,
      ),
    );
  }

  OnDaySelected(DateTime selectedDay, DateTime focuseDay) {
    setState(
      () {
        //state 에서 selectedDay를 가지고 있고, setState를 통해 빌드가 된다.
        // Table캘린더가 렌더링된다. sletedDay가 선택 되지 않을때는 널, 선택된 날짜가 년,월,일과 비교해서 동드라미로 표시하게 된다.
        this.selectedDay = selectedDay;
        focusedDay = selectedDay;
      },
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          /*listview 는 count를 정해서 retun이 가능하다.
                만약 count를 100를 할경우 화면에 100개가 그려지지 않고, 10게가 그려진 후 10개 이상이 되면
                스크롤 할경우에 추가로 렌더링 되어 리소스 관리에 편한 이점이 있다.*/

          itemCount: 5,
          separatorBuilder: (context, Index) {
            /*separator빌더의 경우에는 listview 사이에 들어가는 위젯을 짤 수 있다.
                   */
            return SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
              startTime: 8,
              endTime: 9,
              content: '프로그래밍',
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
