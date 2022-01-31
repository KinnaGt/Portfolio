import 'package:flutter/material.dart';

import '../../../components/animated_progress_indicator.dart';
import '../../../constants/constants.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.7,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.9,
          label: "Kotlin",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "Java",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.6,
          label: "XML",
        ),
      ],
    );
  }
}
