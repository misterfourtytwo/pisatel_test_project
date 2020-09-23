import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pisatel_test_project/models/photo.dart';
import 'package:shimmer/shimmer.dart';

class AvatarWidget extends StatelessWidget {
  final AsyncValueGetter<Photo> photoGetter;
  final bool isBig;
  const AvatarWidget({
    @required this.photoGetter,
    this.isBig = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FutureBuilder(
          future: photoGetter(),
          builder: (context, AsyncSnapshot<Photo> snapshot) => snapshot.hasData
              ? CachedNetworkImage(
                  imageUrl:
                      isBig ? snapshot.data.url : snapshot.data.thumbnailUrl,
                  width: isBig ? 600 : 32,
                  height: isBig ? 600 : 32,
                  progressIndicatorBuilder: (context, url, progress) =>
                      _ShimmerBox(
                        isBig: isBig,
                      ))
              : _ShimmerBox(isBig: isBig),
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final bool isBig;
  const _ShimmerBox({this.isBig, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.btt,
      baseColor: Colors.white,
      highlightColor: Colors.red[800],
      period: Duration(milliseconds: 2020),
      child: SizedBox(
          width: isBig ? 600 : 32,
          height: isBig ? 600 : 32,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
          )),
    );
  }
}
