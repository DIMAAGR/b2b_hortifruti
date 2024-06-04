import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../services/responsive_service.dart';

class AtomCategoryHeader extends StatefulWidget {
  final Widget child;
  final String videoAsset;
  final double? contentWidth;
  final double? contentHeight;
  final Color backgroundColor;
  const AtomCategoryHeader(
      {super.key,
      required this.child,
      required this.videoAsset,
      this.contentWidth,
      this.contentHeight, required this.backgroundColor});

  @override
  State<AtomCategoryHeader> createState() => _AtomCategoryHeaderState();
}

class _AtomCategoryHeaderState extends State<AtomCategoryHeader> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      _controller = VideoPlayerController.asset(widget.videoAsset);
      await _controller!.setLooping(true);
      await _controller!.initialize().then((_) {
        _controller!.play();
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: BorderRadius.circular(32),
      boxShadow: const [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(0, 4),
          color: AppColors.shadow2,
        )
      ],
    );

    return _controller == null
        ? Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            child: Container(
              height: ResponsiveService.isMobile(context) ? 256 : 272,
              width: MediaQuery.of(context).size.width,
              decoration: decoration,
            ),
          )
        : Container(
            decoration: decoration,
            height: ResponsiveService.isMobile(context) ? 256 : 272,
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller!.value.size.width,
                        height: _controller!.value.size.height,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                    SizedBox(
                      height: widget.contentHeight,
                      width: widget.contentWidth,
                      child: Center(child: widget.child),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
