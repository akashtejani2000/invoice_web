part of '../widgets.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Color textColor;
  final double textSize;
  final Widget? child;
  final BorderSide border;

  const CommonButton({
    required this.onPressed,
    this.label,
    this.child,
    this.padding = const EdgeInsets.all(16),
    this.textColor = AppColor.white,
    this.textSize = 16.0,
    this.border = BorderSide.none,
  }) : assert(child == null || label == null, "cannot assing both at once.");

  @override
  Widget build(BuildContext context) {

    return ClickableContainer(
      onTap: onPressed,
      padding: padding,
      borderSide: border,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      splashColor: AppColor.primary.withOpacity(0.1),
      highlightColor: AppColor.primary.withOpacity(0.5),
      color: AppColor.primary,
      child: child ??
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: CommonText.semiBold(label!, size: textSize, color: AppColor.onPrimary),
          ),
    );
  }
}
