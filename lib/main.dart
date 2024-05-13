import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  //context에는 위젯 트리에 대한 정보가 담겨있다.
  //context는 부모 요소에 접근할 수 있게 해준다.
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // Widget Lifecycle: init, build, dispose

  //한번만 호출됨, build보다 먼저 작성되어야 함.
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  //위젯이 스크린에서 제거될 때 호출되는 메서드
  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  //build는 UI를 그려줌.
  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        //context를 사용해서 Theme에 접근한다.
        //'titleLarge, color가 존재한다면' 이라는 가정을 하기 위해 ?를 사용한다.
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
