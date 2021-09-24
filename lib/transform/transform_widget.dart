import 'package:animacoes/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  double _currentSliderValue = 20;

  @override
  void initState() {
    print('estou aqui');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>
              _homeController.changeCurrentScreen(CurrentScreen.idle),
        ),
        title: Text("CALLS"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
                value: _currentSliderValue,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                }),
            RotatedBox(
              quarterTurns: _currentSliderValue.toInt(),
              child: Transform.scale(
                scale: _currentSliderValue / 100,
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
