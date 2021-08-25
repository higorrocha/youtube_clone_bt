import 'package:flutter/material.dart';
import 'package:youtube_clone_bt/Api.dart';
import 'package:youtube_clone_bt/model/Video.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  String search;
  HomeScreen(this.search);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _listVideos(String search){
    Api api = Api();
    return api.searchs(search);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listVideos(widget.search),
      builder: (context, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if( snapshot.hasData ){

              return ListView.separated(
                  itemBuilder: (context, index){

                    List<Video>? videos = snapshot.data;
                    Video video = videos![ index ];

                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage( video.image )
                              )
                          ),
                        ),
                        ListTile(
                          title: Text( video.title ),
                          subtitle: Text( video.channel ),
                        )
                      ],
                    );

                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data!.length
              );

            }else{
              return Center(
                child: Text("Not found data."),
              );
            }
            break;
        }
      },
    );
  }
}
