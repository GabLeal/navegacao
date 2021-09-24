import 'package:animacoes/drop/drop_custom.dart';
import 'package:animacoes/home_controller.dart';
import 'package:animacoes/sliveAnimation/slive_animation.dart';
import 'package:animacoes/transform/transform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Provider.of<HomeController>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(
                Icons.call,
              ),
              onTap: () {
                _homeController
                    .changeCurrentScreen(CurrentScreen.sliveAnimation);
              },
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.ac_unit_outlined),
              onTap: () {
                _homeController.changeCurrentScreen(CurrentScreen.transform);
              },
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.access_alarms),
              onTap: () {
                _homeController
                    .changeCurrentScreen(CurrentScreen.customMenuDrop);
              },
            ),
            label: 'Chats',
          ),
        ],
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Observer(
            builder: (_) {
              switch (_homeController.currentScreen) {
                case CurrentScreen.idle:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, "/slive");
                            _homeController.changeCurrentScreen(
                                CurrentScreen.sliveAnimation);
                          },
                          child: const Text("Slive animation")),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, "/transform");
                            _homeController
                                .changeCurrentScreen(CurrentScreen.transform);
                          },
                          child: const Text("Transform")),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, "/drop");
                            _homeController.changeCurrentScreen(
                                CurrentScreen.customMenuDrop);
                          },
                          child: const Text("Drop dopwn custom"))
                    ],
                  );
                case CurrentScreen.sliveAnimation:
                  return const SliveAnimation();
                case CurrentScreen.transform:
                  return const TransformWidget();
                case CurrentScreen.customMenuDrop:
                  return const DropCustom();
                default:
                  return Container();
              }
            },
          )),
    );
  }
}
