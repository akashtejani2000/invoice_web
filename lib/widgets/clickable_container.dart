import 'package:flutter/material.dart';
import 'package:invoice_web/resourese/src/colors/colors.dart';

class ClickableContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final double? height;
  final double? width;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Clip clipBehavior;
  final BoxConstraints? constraints;
  final Alignment alignment;
  final BorderSide borderSide;
  final DecorationImage? backgroundImage;
  final Gradient? gradient;
  final Matrix4? transform;
  final Color? shadowColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? color;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final VoidCallback? onDoubleTap;

  ClickableContainer({
    required this.child,
    this.onTap,
    this.onLongTap,
    this.onDoubleTap,
    this.splashColor,
    this.highlightColor,
    this.color,
    this.radius,
    this.borderRadius,
    this.margin,
    this.padding,
    this.clipBehavior = Clip.none,
    this.height,
    this.width,
    this.constraints,
    this.alignment = Alignment.center,
    this.borderSide = BorderSide.none,
    this.elevation = 0.0,
    this.shadowColor = Colors.transparent,
    this.gradient,
    this.backgroundImage,
    this.transform,
  })  : assert((splashColor == null && highlightColor == null) ||
            (onTap != null || onLongTap != null || onDoubleTap != null)),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(radius == null || borderRadius == null),
        assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative);

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      padding: padding ?? EdgeInsets.zero,
      alignment: alignment,
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(gradient: gradient, image: backgroundImage),
      child: this.child,
    );

    if (margin != null) child = Padding(padding: margin!, child: child);
    if (transform != null) child = Transform(transform: transform!, child: child);

    if (onTap != null || onLongTap != null || onDoubleTap != null) {
      child = Material(
        color: color ?? AppColor.transparent,
        clipBehavior: clipBehavior,
        type: MaterialType.canvas,
        shape:
        RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0), side: borderSide),
        elevation: elevation,
        shadowColor: shadowColor,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongTap,
          onDoubleTap: onDoubleTap,
          splashColor: splashColor,
          highlightColor: highlightColor,
          child: child,
        ),
      );
    } else {
      child = Material(
        color: color ?? AppColor.transparent,
        clipBehavior: clipBehavior,
        type: MaterialType.canvas,
        shape:
            RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0), side: borderSide),
        elevation: elevation,
        shadowColor: shadowColor,
        child: child,
      );
    }

    return child;
  }
}
