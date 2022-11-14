part of'widgets.dart';

class SquareImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareImageFromAsset(this.image,
      {this.size = 24, this.fit = BoxFit.none, this.color, this.matchTextDirection = true});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,
        fit: fit, color: color, width: size, height: size, matchTextDirection: matchTextDirection);
  }
}

class CircleImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CircleImageFromAsset(this.image,
      {this.size = 24, this.fit = BoxFit.none, this.color, this.matchTextDirection = true});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(image,
            fit: fit, color: color, width: size, height: size, matchTextDirection: matchTextDirection));
  }
}

class CircleSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CircleSvgImageFromAsset(this.image,
      {this.size = 24, this.fit = BoxFit.none, this.color, this.matchTextDirection = true});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: SvgPicture.asset(image,
            fit: fit, color: color, width: size, height: size, matchTextDirection: matchTextDirection));
  }
}

class SquareSvgImageFromAsset extends StatelessWidget {
  final String image;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const SquareSvgImageFromAsset(this.image,
      {this.size = 24, this.fit = BoxFit.contain, this.color, this.matchTextDirection = true});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image,
        fit: fit, color: color, width: size, height: size, matchTextDirection: matchTextDirection);
  }
}

class CircleImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final double size;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CircleImageFromNetwork({
    required this.imageUrl,
    required this.placeholder,
    this.size = 24,
    this.fit = BoxFit.none,
    this.color,
    this.matchTextDirection = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: size,
        height: size,
        imageUrl: imageUrl,
        httpHeaders: {'Authorization': 'Bearer ${AppPref.userToken}'},
        placeholder: (context, url) => Image.asset(placeholder, fit: fit),
        errorWidget: (context, url, error) => Image.asset(placeholder, fit: fit),
        fit: fit,
        useOldImageOnUrlChange: true,
      ),
    );
  }
}

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final bool matchTextDirection;

  const CachedImage({
    required this.imageUrl,
    required this.placeholder,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.none,
    this.color,
    this.matchTextDirection = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl,
        httpHeaders: {'Authorization': 'Bearer ${AppPref.userToken}'},
        placeholder: (context, url) => Image.asset(placeholder, fit: fit),
        errorWidget: (context, url, error) => Image.asset(placeholder, fit: fit),
        fit: fit,
        useOldImageOnUrlChange: true,
      ),
    );
  }
}
