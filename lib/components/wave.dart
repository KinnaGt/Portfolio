import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Wave extends StatelessWidget {
  const Wave({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
    config: CustomConfig(
        gradients: [
            [Colors.red, Color(0xEEF44336)],
            [Colors.red, Color(0x77E57373)],
            [Colors.orange, Color(0x66FF9800)],
            [Colors.yellow, Color(0x55FFEB3B)]
        ],
        heightPercentages: [0.20, 0.23, 0.25, 0.30],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
        
    durations: [
        32000,
        21000,
        18000,
        5000,
    ],
    ),
    waveAmplitude: 0,
    backgroundImage: DecorationImage(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
        ),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.white, BlendMode.softLight),
    ),
    size: Size(
        double.infinity,
        double.infinity,
    ),
    );
  }
}