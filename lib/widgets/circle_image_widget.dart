import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  // final String placeholder;
  final String url;
  final Color borderColor;
  final Color backgroundColor;
  final double borderWidth;
  final File? imageFile;
  final IconData? icon;
  final BoxFit fit;
  final bool enableBorders;

  const CircleImageWidget({
    Key? key,
    this.width = 65,
    this.height = 65,
    // this.placeholder = "assets/images/avatar.png",
    required this.url,
    this.radius = 65 / 2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 1,
    this.imageFile,
    this.icon,
    this.fit = BoxFit.cover,
    this.enableBorders = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: enableBorders
            ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: imageFile == null && icon == null
            ? CachedNetworkImage(
                imageUrl: url,
                placeholder: (context, url) =>
                    // Image(image: AssetImage(placeholder), fit: fit),
                    Image(
                        image: const NetworkImage(
                            'https://c1.alamy.com/thumbs/2c80ydc/user-profile-grey-icon-web-avatar-employee-symbol-2c80ydc.jpg'),
                        fit: fit),
                errorWidget: (context, url, _) => Image(
                    image: NetworkImage(
                        'https://c1.alamy.com/thumbs/2c80ydc/user-profile-grey-icon-web-avatar-employee-symbol-2c80ydc.jpg'),
                    fit: fit),
                imageBuilder: (ctx, imageProvider) => Image(
                  image: imageProvider,
                  fit: fit,
                ),
              )
            : icon != null
                ? Icon(
                    icon,
                    size: 18,
                    color: const Color(0xff4fd5dc),
                  )
                : imageFile != null
                    ? Image.file(imageFile!, fit: fit)
                    : Image(
                        image: NetworkImage(
                            'https://c1.alamy.com/thumbs/2c80ydc/user-profile-grey-icon-web-avatar-employee-symbol-2c80ydc.jpg'),
                        fit: fit),
      ),
    );
  }
}
