import 'package:flutter/material.dart';

class CooszyTitle extends StatelessWidget {
  final String textStandard;
  final String textStyled;
  final bool wrapNeeded;

  const CooszyTitle(
      {super.key,
      required this.textStandard,
      required this.textStyled,
      required this.wrapNeeded});

  @override
  Widget build(BuildContext context) {
    return wrapNeeded
        ? Flexible(
            flex: 6,
            child: _buildRichText(context),
          )
        : Column(
            children: [
              _buildRichText(context),
            ],
          );
  }

  RichText _buildRichText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        children: <TextSpan>[
          TextSpan(
              text: textStandard,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                height: 1.0,
              )),
          TextSpan(
              text: textStyled,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kaushan Script',
                height: 1.0,
              )),
        ],
      ),
    );
  }
}
