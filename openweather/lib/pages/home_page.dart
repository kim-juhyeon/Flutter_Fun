import 'package:flutter/material.dart';
import 'package:openweather/models/weather.dart';
import 'package:openweather/pages/search_page.dart';
import 'package:openweather/providers/weather/weather_provider.dart';
import 'package:openweather/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? _city;
  late final WeatherProvider _weatherProv;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<WeatherProvider>();
    _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _weatherProv.removeListener(_registerListener);
    super.dispose();
  }

  void _registerListener() {
    final WeatherState ws = context.read<WeatherProvider>().state;

    if (ws.status == WeatherStatus.error) {
      errorDialog(context, ws.error.errMsg);
    }
  }

  Widget _showWeather() {
    final state = context.watch<WeatherProvider>().state;

    if (state.status == WeatherStatus.initial) {
      //body  부분에 데이터를 가져올려고 할때 status가 초기값과 동일하면 초기화를 해줍니다.
      return Center(
        child: Text(
          'Select a city',
          style: const TextStyle(fontSize: 20.0),
        ),
      );
    }
    if (state.status == WeatherStatus.loading) {
      //상태가 로딩중처리
      if (state.status == WeatherStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }
    if (state.status == WeatherStatus.error && state.weather.name == "") {
      return Center(
        child: const Text(
          'select a city',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        Text(
          state.weather.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TimeOfDay.fromDateTime(state.weather.lastUpdated).format(context),
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(width: 10.0),
            Text(
              '(${state.weather.country})',
              style: const TextStyle(fontSize: 18.0),
            )
          ],
        )
      ],
    );
  }

  _fetchWeather() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<WeatherProvider>().fetchWeather('london');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
              print('city : $_city');
              if (_city != null) {
                //null 이 아닐경우 weatherProvider을 불러와서 데이터를 보여줍니다. (검색에 해당하는 나라의 날씨)
                context.read<WeatherProvider>().fetchWeather(_city!);
              }
            },
          )
        ],
      ),
      body: _showWeather(),
    );
  }
}
