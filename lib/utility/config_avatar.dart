import 'package:flutter/material.dart';

class ConfigAvatar extends StatelessWidget {
  final String urlImage;
  final double? size;
  const ConfigAvatar({
    Key? key,
    required this.urlImage,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 24,
      backgroundImage: NetworkImage(urlImage),
    );
  }
}


class ConfigCircleAvatar extends StatelessWidget {
  final String path;
  final double? radius;
  const ConfigCircleAvatar({
    Key? key,
    required this.path,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 36,
      // height: 36,
      child: CircleAvatar(radius: radius ?? 25,
        backgroundImage: NetworkImage(path),
      ),
    );
  }
}
