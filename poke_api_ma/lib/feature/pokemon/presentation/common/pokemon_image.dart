import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    super.key,
    required this.imageUrl,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.placeholder = AppAssets.pokeball,
  });

  static const Size _cacheMaxSize = Size(700, 700);

  final String imageUrl;
  final EdgeInsets padding;
  final Size size;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutQuint,
        padding: padding,
        child: defaultTargetPlatform == TargetPlatform.windows
            ? Image.network(
                imageUrl,
                width: size.width,
                height: size.height,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                useOldImageOnUrlChange: true,
                maxWidthDiskCache: _cacheMaxSize.width.toInt(),
                maxHeightDiskCache: _cacheMaxSize.height.toInt(),
                fadeInDuration: const Duration(milliseconds: 120),
                fadeOutDuration: const Duration(milliseconds: 120),
                imageBuilder: (_, image) => Image(
                  image: image,
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                ),
                errorWidget: (_, __, ___) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage(placeholder),
                      width: size.width,
                      height: size.height,
                      color: Colors.black12,
                    ),
                    Icon(
                      Icons.warning_amber_rounded,
                      size: size.width * 0.3,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
