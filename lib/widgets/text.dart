part of 'widgets.dart';



class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isItalic;
  final double height;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  const CommonText(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
    this.onTap,
  });

  const CommonText.extraBold(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w800;

  const CommonText.bold(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w700;

  const CommonText.semiBold(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w600;

  const CommonText.medium(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w500;

  const CommonText.regular(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w400;

  const CommonText.light(
    this.text, {
    this.size = 12,
    this.color = AppColor.black,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height = 1.5,
    this.letterSpacing,
    this.onTap,
  }) : this.fontWeight = FontWeight.w300;

  @override
  Widget build(BuildContext context) {
    var child = Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontStyle: isItalic ? FontStyle.italic : null,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );

    return onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
  }
}
