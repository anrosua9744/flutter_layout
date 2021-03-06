import 'package:flutter/material.dart';

// MyApp을 시작 위젯으로 설정하여 앱을 실행
void main() => runApp(MyApp());

// 앱의 시작점에 해당하는 위젯
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //본 앱의 테마의 대펴색상을 필드에 저장
    Color color = Theme
        .of(context)
        .primaryColor;

    //버튼 로우 구성을 위한 컨테이너 위젯
    Widget buttonSection = Container(
      child: Row( // 로우를 자식으로 가짐
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 자식들이 여유 공간을 공편하게 나눠가짐
        children: <Widget>[ // 세개의 위젯들을 자식들로 가짐
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTH'),
          _buildButtonColumn(color, Icons.share, 'SHARE')
        ],
      ),
    );
    // 매트리얼앱을 생성하여 반환
    return MaterialApp(
        title: '플루터 레이아웃 앱', // 앱의 타이틀
        theme: ThemeData(
          // 앱의 테마 설정
            primarySwatch: Colors.red // 주요 테마 색상
        ),

        // 홈 설정. 홈은 메트리얼앱의 시작점
        home: Scaffold(
          appBar: AppBar(
            title: Text("플루터 레이아웃 데모"),
          ),
          body: ListView( // 컬럼으로 교체
            // 자식들을 추가
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 400,
                height: 240,
                fit: BoxFit.cover,
              ),

              titleSection, // titleSection 컨테이너 추가
              buttonSection,  // buttonSection 컨테이너 추가
              textSection // textSection 컨테이너 추가
            ],
          ),
        )
    );
  }

  //컨테이터 위젯 구현
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32), // 컨테이너 내부 상하좌우에 32픽셀만큼의 패딩 삽입
    child: Row( // 자식으로 로우를 추가
      children: <Widget>[ // 로우에 위젯들(Expanded, Icon, Text)을 자식들로 추가
        Expanded( // 첫번째 자식
          child: Column( // 첫번째 자식의 자식으로 컬럼 추가
            crossAxisAlignment: CrossAxisAlignment.start, // 자식들을 왼쪽정렬로 배치함
            children: <Widget>[ // 컬럼의 자식들로 컨테이너와 텍스트를 추가
              Container( // 컬럼의 첫번째 자식 컨테이너
                padding: const EdgeInsets.only(bottom: 8),
                // 컨테이너 내부 하단에 8픽셀만큼 패딩 삽입
                child: Text( // 컨테이너의 자식으로 텍스트 삽입
                  "Oeschinen Lake Campground",
                  style: TextStyle(
                      fontWeight: FontWeight.bold // 텍스트 강조 설정
                  ),
                ),
              ),
              Text( // 컬럼의 두번째 자식으로 텍스트 삽입
                'Kandersteg, Switzerland',
                style: TextStyle(
                    color: Colors.grey[500] // 텍스트의 색상을 설정
                ),
              )
            ],
          ),
        ),
        Icon( // 두번째 자식 아이콘
          Icons.star, // 별모양 아이콘 삽입
          color: Colors.red[500], // 빨간색으로 설정
        ),
        Text('43') // 세번째 자식  텍스트 표시
      ],
    ),
  );

  // 버튼과 텍스트로 구성된 컬럼을 생성하여 반환하는 함수
  Column _buildButtonColumn(Color color,IconData icon, String label){
    // 컬럼을 생성하여 반환
    return Column(
      mainAxisSize: MainAxisSize.min, // 여유공간을 최소로 할당
      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
      // 컬럼의 자식들로 아이콘과 컨테이너를 등록
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),  // 컨테이너 상단에 8픽셀의 마진을 할당
          child: Text(  // 텍스트 할당
            label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color
            ),
          ),
        )
      ],
    );
  }
  // 텍스트로 구성된 컨테이너를 구현하는 위젯
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true, // 텍스트가 영역을 넘어갈 경우 줄바꿈 여부
    ),
  );

}