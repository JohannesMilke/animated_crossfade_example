import 'package:animated_crossfade_example/main.dart';
import 'package:flutter/material.dart';

class AdvancedPage extends StatefulWidget {
  @override
  _AdvancedPageState createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  bool isSmallerImage = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                duration: Duration(milliseconds: 3000),
                layoutBuilder:
                    (topChild, topChildKey, bottomChild, bottomChildKey) =>
                        Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      key: bottomChildKey,
                      child: bottomChild,
                      top: 0.0,
                    ),
                    Positioned(
                      key: topChildKey,
                      child: topChild,
                    ),
                  ],
                ),
                crossFadeState: isSmallerImage
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.network(
                    'https://source.unsplash.com/featured/?light',
                    fit: BoxFit.cover,
                  ),
                ),
                secondChild: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://source.unsplash.com/featured/?dark',
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Toggle Image',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () =>
                    setState(() => isSmallerImage = !isSmallerImage),
              )
            ],
          ),
        ),
      );
}
