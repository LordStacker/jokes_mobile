import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatelessWidget {
  final String id;
  final double size;

  const Avatar({required this.id, this.size = 300, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SvgPicture.network(
        "https://api.multiavatar.com/$id .svg",
        width: size,
        height: size,
      ),
    );
  }
}