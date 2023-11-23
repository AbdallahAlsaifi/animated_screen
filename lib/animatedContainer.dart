import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late AnimationController _controller2;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(3, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation2 = Tween<Offset>(
      begin: Offset(-3, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Center(
              child: SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/security.gif',
                  scale: 0.35,
                ),
              ),
            ),
            Center(
              child: SlideTransition(
                  position: _animation2,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 50,
                        color: Colors.white,
                      ))),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: SlideTransition(
                  position: _animation2,
                  child: Text(
                    'We Provide Security',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black.withOpacity(0.8)),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: SlideTransition(
                  position: _animation2,
                  child: Text(
                    'We Provide Security frertg grfbijobvnjb vhvufrvufrvifrv hdrfnv ufriuvhrifvdfvbifbn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey.withOpacity(0.8)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
