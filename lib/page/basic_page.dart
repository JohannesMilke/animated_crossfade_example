import 'package:animated_crossfade_example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicPage extends StatefulWidget {
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://source.unsplash.com/featured/?face',
                  ),
                  radius: 100,
                ),
                SizedBox(height: 32),
                AnimatedCrossFade(
                  duration: Duration(milliseconds: 3000),
                  reverseDuration: Duration(milliseconds: 600),
                  crossFadeState: isFollowing
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Follow', style: TextStyle(fontSize: 20)),
                    onPressed: () => setState(() => isFollowing = true),
                  ),
                  secondChild: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Unfollow',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () => setState(() => isFollowing = false),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
