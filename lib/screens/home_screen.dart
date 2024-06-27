import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Flutter3DController controller;
  String animationName = 'Survey';

  @override
  void initState() {
    super.initState();
    controller = Flutter3DController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (animationName == 'Survey') {
              animationName = 'Walk';
            } else if (animationName == 'Walk') {
              animationName = 'Run';
            } else {
              animationName = 'Survey';
            }
            controller.playAnimation(animationName: animationName);
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.animation,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '3D Model Viewer',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Flutter3DViewer(
                    controller: controller,
                    src: 'assets/models/fox.glb',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
