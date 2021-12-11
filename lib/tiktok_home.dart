import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TiktokHome extends StatefulWidget {
  const TiktokHome({Key? key}) : super(key: key);

  @override
  _TiktokHomeState createState() => _TiktokHomeState();
}

class _TiktokHomeState extends State<TiktokHome> {
  late VideoPlayerController _controller;
  PageController pageController = PageController();

  // List<String> videos = [
  //   "assets/videos/wildlife.mp4",
  //   "assets/videos/bridge.mp4",
  //   "assets/videos/tree.mp4",
  //   "assets/videos/moon.mp4",
  //   "assets/videos/horses.mp4",
  //   "assets/videos/clouds.mp4",
  //   "assets/videos/wildlife.mp4",
  //   "assets/videos/fishes.mp4",
  // ];

  @override
  void initState() {
    super.initState();

    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/videos/wildlife.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> images = [
    //   "assets/images/1.jpg",
    //   "assets/images/2.jpg",
    //   "assets/images/3.jpg",
    //   "assets/images/1.jpg",
    //   "assets/images/2.jpg",
    //   "assets/images/3.jpg",
    // ];
    return PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        //// never scrollable physics makes the list view un scrollable
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          print(index.toString());
        },
        itemCount: 100,
        itemBuilder: (context, index) {
          return SafeArea(
              child: Scaffold(
                  // TODO 6: Create a Stack Widget
                  body: Stack(children: <Widget>[
            // Image.asset(images[index]),
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.none,
                // clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("@Account_Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text("Video Description",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text("#Video #Tags",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Container(
                            child: Row(
                          children: [
                            Icon(Icons.music_note),
                            Text("Music Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                      ],
                    )),
                    Spacer(flex: 25),
                    Container(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Following | For You",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    Spacer(flex: 500),
                    // Container(
                    //   child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text("For You",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold)),
                    //       ]),
                    // ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/1.jpg',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            Icon(Icons.favorite, color: Colors.red, size: 50),
                            Text("1.3M",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Icon(Icons.comment, color: Colors.orange, size: 50),
                            Text("1.3M",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Icon(Icons.screen_share_outlined,
                                color: Colors.yellow, size: 50),
                            Text("1.3M",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 30),
                        ClipOval(
                          child: Image.asset('assets/images/1.jpg',
                              height: 50, width: 50, fit: BoxFit.cover),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ])));
        });
  }
}
