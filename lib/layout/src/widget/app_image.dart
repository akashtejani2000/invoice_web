import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice_web/resourese/src/images/images.dart';
import 'package:path/path.dart' as path;

enum _ImageSource {
  fromAsset,
  fromNetwork,
}

class AppImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final Color? color;
  final String? placeHolder;
  final bool matchTextDirection;
  final _ImageSource _source;

  const AppImage.asset(
    this.image, {
    this.width = 24,
    this.height = 24,
    this.fit,
    this.color,
    this.radius,
    this.placeHolder,
    this.matchTextDirection = true,
    Key? key,
  })  : _source = _ImageSource.fromAsset,
        super(key: key);

  const AppImage.squareAsset(
    this.image, {
    double size = 24,
    this.fit,
    this.color,
    this.radius,
    this.matchTextDirection = true,
    this.placeHolder,
    Key? key,
  })  : width = size,
        height = size,
        _source = _ImageSource.fromAsset,
        super(key: key);

  const AppImage.circleAsset(
    this.image, {
    double size = 24,
    this.fit,
    this.color,
    this.matchTextDirection = true,
    this.placeHolder,
    Key? key,
  })  : width = size,
        radius = size / 2,
        height = size,
        _source = _ImageSource.fromAsset,
        super(key: key);

  const AppImage.network(
    this.image, {
    this.width = 24,
    this.height = 24,
    this.fit,
    this.color,
    this.radius,
    this.matchTextDirection = true,
    this.placeHolder,
    Key? key,
  })  : _source = _ImageSource.fromNetwork,
        super(key: key);

  const AppImage.squareNetwork(
    this.image, {
    double size = 24,
    this.fit,
    this.color,
    this.radius,
    this.matchTextDirection = true,
    Key? key,
    this.placeHolder,
  })  : width = size,
        height = size,
        _source = _ImageSource.fromNetwork,
        super(key: key);

  const AppImage.circleNetwork(
    this.image, {
    double size = 24,
    this.fit,
    this.color,
    this.matchTextDirection = true,
    Key? key,
    this.placeHolder,
  })  : width = size,
        radius = size / 2,
        height = size,
        _source = _ImageSource.fromNetwork,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    bool isSvgImage = path.extension(image) == ".svg";
    switch (_source) {
      case _ImageSource.fromAsset:
        if (isSvgImage) {
          child = SvgPicture.asset(
            image,
            color: color,
            width: width,
            height: height,
            fit: fit ?? BoxFit.scaleDown,
            matchTextDirection: matchTextDirection,
          );
        } else {
          child = Image.asset(
            image,
            color: color,
            width: width,
            height: height,
            fit: fit ?? BoxFit.scaleDown,
            matchTextDirection: matchTextDirection,
          );
        }
        break;
      case _ImageSource.fromNetwork:
        if (isSvgImage) {
          child = SvgPicture.network(
            image,
            color: color,
            width: width,
            height: height,
            fit: fit ?? BoxFit.scaleDown,
            matchTextDirection: matchTextDirection,
            placeholderBuilder: (context) => AppImage.circleAsset(placeHolder ?? AppImages.placeholder, fit: BoxFit.cover),
          );
        } else {
          child = CachedNetworkImage(
              imageUrl: image,
              color: color,
              width: width,
              height: height,
              fit: fit ?? BoxFit.scaleDown,
              matchTextDirection: matchTextDirection,
              placeholder: (context, url) {
                return AppImage.circleAsset(placeHolder ?? AppImages.placeholder,fit: BoxFit.cover,);
              },
              errorWidget: (context, url, error) {
                return AppImage.circleAsset(placeHolder ?? AppImages.placeholder,fit: BoxFit.cover,);
              });
        }
        break;
      default:
        child = const SizedBox.shrink();
        break;
    }
    if (radius != null && radius! > 0) {
      child = ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(radius!),
        child: child,
      );
    }
    return child;
  }
}

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final Widget? placeholderWidget;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CachedImage({
    required this.imageUrl,
    this.placeholder,
    this.placeholderWidget,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.none,
    this.color,
    this.matchTextDirection = true,
    Key? key,
  })  : assert(placeholder == null || placeholderWidget == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          placeholderWidget ?? (placeholder!.isEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
      errorWidget: (context, url, error) =>
          placeholderWidget ?? (placeholder!.isEmpty ? const SizedBox.shrink() : Image.asset(placeholder!, fit: fit)),
      fit: fit,
      useOldImageOnUrlChange: true,
    );
  }
}
