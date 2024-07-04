import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({required this.movie});

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false; // 추가: 내가 찜한 콘텐츠 여부를 나타내는 변수

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/' + widget.movie.poster),
                            fit: BoxFit.cover)),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.asset(
                                      'images/' + widget.movie.poster),
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '99% 일치 2019 15+ 시즌 1개',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.play_arrow),
                                        Text('재생')
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                      '뜻밖의 돌풍은 행운일까, 불운일까, 패러글라이딩 사고로 북한에 불시착한 \n재벌딸.그곳에서 깐깐한 북한군 장교를 만난다. 이 와중에 피어오르는 낯선 감정은 뭐지?'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 12),
                                  ),
                                ),
                                Container(
                                  color: Colors.black26,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: InkWell(
                                          onTap: () {
                                            // 추가: 내가 찜한 콘텐츠 버튼 클릭 시 동작
                                            setState(() {
                                              like = !like;
                                            });
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              like
                                                  ? Icon(Icons.check)
                                                  : Icon(Icons.add),
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                              ),
                                              Text(
                                                '내가 찜한 콘텐츠',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white60),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Icon(Icons.thumb_up),
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                              ),
                                              Text(
                                                '평가',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white60),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Icon(Icons.send),
                                              Padding(padding: EdgeInsets.all(5),),
                                              Text(
                                                '공유',
                                                style: TextStyle(fontSize: 11, color: Colors.white60),
                                              )
                                            ],
                                          ),),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],
              )
            ],
          ),
          //makeMenuButton(),
        ),
      ),
    );
  }
}
