import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context1) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var myhome = Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image.asset('images/homeblue.jpg'),
          Container(
            alignment: Alignment.center,
            child: IconButton(
                icon: Icon(
                  Icons.play_circle_filled,
                  color: Colors.blue[300],
                ),
                iconSize: 70,
                onPressed: () {
                  Navigator.push(
                    context1,
                    MaterialPageRoute(builder: (context1) => SecondRoute()),
                  );
                }),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 150),
            child: Text(
              "MV Player",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );

    return myhome;
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    var shareicon = Icon(
      Icons.share,
      color: Colors.white,
    );

    sharepress() {
      Fluttertoast.showToast(
        msg: "Sharing is Caring",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 50.0,
        backgroundColor: Colors.black,
      );
    }

    var bookmark = Icon(
      Icons.bookmark,
      color: Colors.white,
    );

    bookpress() {
      Fluttertoast.showToast(
        msg: "Have Some Bookmarks!",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 50.0,
        backgroundColor: Colors.black,
      );
    }

    var mybutton1 = IconButton(
      icon: bookmark,
      onPressed: bookpress,
    );
    var mybutton2 = IconButton(
      icon: shareicon,
      onPressed: sharepress,
    );

    var myappbar = AppBar(
      title: Title(
          color: Colors.amber,
          child: Text(
            "Play!",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )),
      backgroundColor: Colors.deepPurple[900],
      leading: IconButton(
          icon: Icon(Icons.dehaze, color: Colors.white), onPressed: null),
      actions: <Widget>[
        mybutton1,
        mybutton2,
      ],
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 250, right: 10),
              //    color: Colors.red,
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),

              child: RaisedButton(
                color: Colors.blue[800],
                onPressed: () {
                  Navigator.push(
                    context2,
                    MaterialPageRoute(builder: (context2) => MusicRoute()),
                  );
                },
                child: Text(
                  "Music",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 100,
              margin: EdgeInsets.only(top: 250, left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: RaisedButton(
                color: Colors.blue[800],
                onPressed: () {
                  Navigator.push(
                    context2,
                    MaterialPageRoute(builder: (context2) => VideoRoute()),
                  );
                },
                child: Text(
                  "Video",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

String audiourl;

class MusicRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text("Make Your Choice: Music"),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(top: 100),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AssetAudio()),
                    );
                  },
                  child: Text("Avengers: Theme"),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  onPressed: null,
                  child: Text("Coming Soon ..."),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 150, left: 50, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the link for Online Content',
                  ),
                  onChanged: (val) {
                    audiourl = val;
                  },
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RemoteAudio()),
                    );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

var audioPlayer = AudioPlayer();
var audio = AudioCache();

int i = 1;
local() {
  if (i == 1) {
    playLocal();
  }
  if (i != 1) {
    resume();
  }
}

remote() {
  if (i == 1) {
    playRemote();
  }
  if (i != 1) {
    resume();
  }
}

playLocal() async {
  audioPlayer = await audio.play('avengers.mp3');
}

playRemote() async {
  audioPlayer.play("$audiourl");
}

resume() async {
  await audioPlayer.resume();
}

stop() async {
  await audioPlayer.stop();
  i = 1;
}

pause() async {
  await audioPlayer.pause();
  i = i + 1;
}

class AssetAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[300],
            ),
            //         color: Colors.blue[300],
            height: 50,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.pause_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: pause),
                IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: local),
                IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    onPressed: stop),
              ],
            ),
          ),
          Container(
            height: 300,
            width: 300,
            margin: EdgeInsets.only(bottom: 200),
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black),
            child: Image.asset(
              'images/avengers.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class RemoteAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[300],
            ),
            //         color: Colors.blue[300],
            height: 50,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.pause_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: pause),
                IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: remote),
                IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    onPressed: stop),
              ],
            ),
          ),
          Container(
            height: 300,
            width: 300,
            margin: EdgeInsets.only(bottom: 200),
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black),
            child: Image.asset(
              'images/musicbg.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text("Make Your Choice: Video"),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(top: 100),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AssetVideo()),
                    );
                  },
                  child: Text("Avengers: Compications"),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  onPressed: null,
                  child: Text("Coming Soon ..."),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 150, left: 50, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the link for Online Content',
                  ),
                  onChanged: (val) {
                    url = val;
                  },
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RemoteVideo()),
                    );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

String url;
String filename;

class AssetVideo extends StatefulWidget {
  @override
  AssetVideoState createState() => AssetVideoState();
}

class AssetVideoState extends State<AssetVideo> {
  VideoPlayerController mvplayer;

  @override
  void initState() {
    super.initState();
//    mvplayer = VideoPlayerController.network(
//      '$url',
//    );
    mvplayer = VideoPlayerController.asset('assets/avengers.mp4');

    mvplayer.addListener(() {
      setState(() {});
    });
    mvplayer.setLooping(true);
    mvplayer.initialize();
  }

  @override
  void dispose() {
    mvplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mybody = Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'images/bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: <Widget>[
            Container(padding: const EdgeInsets.only(top: 20.0)),
            Text('Remote Video'),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: mvplayer.value.aspectRatio,
                child: Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(mvplayer),
                      _PlayPauseOverlay(
                        controller: mvplayer,
                      ),
                      VideoProgressIndicator(mvplayer, allowScrubbing: true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Text("Video Player")),
          backgroundColor: Colors.blue[900],
        ),
        body: mybody,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}

class RemoteVideo extends StatefulWidget {
  @override
  RemoteVideoState createState() => RemoteVideoState();
}

class RemoteVideoState extends State<RemoteVideo> {
  VideoPlayerController mvplayer;

  @override
  void initState() {
    super.initState();
    mvplayer = VideoPlayerController.network(
      '$url',
    );

    mvplayer.addListener(() {
      setState(() {});
    });
    mvplayer.setLooping(true);
    mvplayer.initialize();
  }

  @override
  void dispose() {
    mvplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mybody = Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'images/bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: <Widget>[
            Container(padding: const EdgeInsets.only(top: 20.0)),
            Text('Remote Video'),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: mvplayer.value.aspectRatio,
                child: Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(mvplayer),
                      _PlayPauseOverlay(
                        controller: mvplayer,
                      ),
                      VideoProgressIndicator(mvplayer, allowScrubbing: true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Text("Video Player")),
          backgroundColor: Colors.blue[900],
        ),
        body: mybody,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
