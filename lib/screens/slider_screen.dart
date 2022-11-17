import 'package:flutter/material.dart';
import 'package:screens/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 50;
  bool _isSlideEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliders And Checks"),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            max: 400,
            min: 50,
            value: _sliderValue,
            onChanged: _isSlideEnable ? _changeValueSlider : null,
            activeColor: AppTheme.primaryColor,
          ),
          CheckboxListTile(
            value: _isSlideEnable,
            onChanged: _changeEnableSlider,
            title: const Text("Enable resize"),
          ),
          SwitchListTile.adaptive(
            value: _isSlideEnable,
            onChanged: _changeEnableSlider,
            title: const Text("Enable resize"),
          ),
          ResizeImage(sliderValue: _sliderValue),
        ],
      ),
    );
  }

  void _changeValueSlider(double newValue) {
    setState(() => _sliderValue = newValue);
  }

  void _changeEnableSlider(bool? isEnable) {
    setState(() => _isSlideEnable = isEnable ?? true);
  }
}

class ResizeImage extends StatelessWidget {
  const ResizeImage({
    Key? key,
    required double sliderValue,
  })  : _sliderValue = sliderValue,
        super(key: key);

  final double _sliderValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: const NetworkImage(
                  "https://static.wikia.nocookie.net/marvel_dc/images/4/4b/Batman_Vol_3_86_Textless.jpg/revision/latest?cb=20200502132734"),
              height: _sliderValue,
              fit: BoxFit.cover,
            ),
            // ! add this for doing overflow for active scroll
            Container(
              height: 200,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
