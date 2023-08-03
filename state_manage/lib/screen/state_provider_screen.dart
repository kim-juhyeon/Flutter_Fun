import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manage/layout/default_layout.dart';
import 'package:state_manage/riverpod/state_provider_screen.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //외부에서 넘어오는 riverpod은 watch , 뭔가 눌렀을때 반응하는 것 riverpod.read의 해당합니다.
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreenfirst',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                //provider_Screen에 ref는 update에 있는 state와 동일하다. 업데이트 함수를 이용
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('up'),
            )
          ],
        ),
        
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreenfirst',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _NextScreen(),
                  ),
                );
              },
              child: Text('NextScreen'),
            )
          ],
        ),
      ),
    );
  }
}
