import 'package:invoice_web/layout/src/widget/app_image.dart';
import 'package:invoice_web/resourese/src/colors/colors.dart';
import 'package:invoice_web/resourese/src/images/images.dart';
import 'package:invoice_web/ui/widgets/clickable_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_web/ui/widgets/src/image.dart';
import 'package:lottie/lottie.dart';

part 'src/button.dart';

part 'src/drop_down.dart';

part 'src/text.dart';

part 'src/text_field.dart';

class SizeBoxV extends StatelessWidget {
  final double size;

  const SizeBoxV([this.size = 4]);

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}

class SizeBoxH extends StatelessWidget {
  final double size;

  const SizeBoxH([this.size = 4]);

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}

class LeadingBackIcon extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;

  const LeadingBackIcon({this.color = AppColor.black, this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.circle,
        color: AppColor.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap ?? Navigator.of(context).pop,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SquareSvgImageFromAsset(AppImages.addItem, color: color, fit: BoxFit.contain),
          ),
        ),
      );
}

class AppBarIcon extends StatelessWidget {
  final String image;
  final Color? color;
  final VoidCallback onTap;

  const AppBarIcon(this.image, {required this.onTap, this.color});

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.circle,
        color: AppColor.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SquareSvgImageFromAsset(image, color: color, fit: BoxFit.contain),
          ),
        ),
      );
}

class CircleLoader extends StatelessWidget {
  final double size;

  const CircleLoader({this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/loader_lottie.json",
      repeat: true,
      width: size,
      height: size,
    );
  }
}
