import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_movie.dart';
import 'package:flutter_application/widget/box_slider.dart';
import 'package:flutter_application/widget/carousel_slider.dart';
import 'package:flutter_application/widget/circle_slider.dart';

// HomeScreen 클래스 정의, StatefulWidget을 상속하여 상태를 유지하는 위젯을 만듦
class HomeScreen extends StatefulWidget {
  // _HomeScreenState 클래스의 인스턴스를 생성
  _HomeScreenState createState() => _HomeScreenState();
}

// _HomeScreenState 클래스 정의, HomeScreen 위젯의 상태를 관리
class _HomeScreenState extends State<HomeScreen> {
  // Firestore로부터 오는 데이터를 스트림으로 받아옴
  late Stream<QuerySnapshot> streamData;

  // 위젯이 생성될 때 실행되는 초기화 메서드
  @override
  void initState() {
    super.initState();
    // Firestore의 'movie' 컬렉션으로부터 실시간 데이터를 스트림으로 가져옴
    streamData = FirebaseFirestore.instance.collection('movie').snapshots();
  }

  // 데이터를 가져오는 메서드, StreamBuilder를 사용하여 실시간 데이터를 가져옴
  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamData,
      builder: (context, snapshot) {
        // 데이터가 없을 경우 로딩 인디케이터를 표시
        if (!snapshot.hasData) return LinearProgressIndicator();
        // 데이터가 있을 경우 _buildBody 메서드를 호출하여 데이터를 빌드
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  // 가져온 데이터를 기반으로 UI를 구성하는 메서드
  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    // DocumentSnapshot 리스트를 Movie 객체 리스트로 변환
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    // ListView를 사용하여 여러 위젯을 수직으로 나열
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // 캐러셀 이미지를 표시하는 위젯, movies 리스트를 전달
            CarouselImage(movies: movies),
            // 상단바를 표시하는 위젯
            TopBar(),
          ],
        ),
        // 원형 슬라이더를 표시하는 위젯, movies 리스트를 전달
        CircleSlider(movies: movies),
        // 박스 슬라이더를 표시하는 위젯, movies 리스트를 전달
        BoxSlider(movies: movies),
      ],
    );
  }

  // HomeScreen 위젯의 빌드 메서드, 실제 UI를 반환
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fetchData(context), // 데이터를 가져오는 메서드를 호출하여 반환
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
