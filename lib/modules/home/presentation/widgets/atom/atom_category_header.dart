import 'package:b2b_hortifruti/modules/home/presentation/extensions/box_decoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../services/responsive_service.dart';
import '../../styles/atom_shadow_style.dart';

class AtomCategoryHeader extends StatefulWidget {
  final Widget child;
  final String videoAsset;
  final double? contentWidth;
  final double? contentHeight;
  final Color backgroundColor;

  const AtomCategoryHeader({
    super.key,
    required this.child,
    required this.videoAsset,
    this.contentWidth,
    this.contentHeight,
    required this.backgroundColor,
  });

  @override
  State<AtomCategoryHeader> createState() => _AtomCategoryHeaderState();
}

class _AtomCategoryHeaderState extends State<AtomCategoryHeader> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.videoAsset,
      videoPlayerOptions: !kIsWeb ? VideoPlayerOptions(mixWithOthers: true) : null,
    );
    _initializeVideoFuture = _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    await _controller.initialize();
    _controller.setVolume(0);
    _controller.setLooping(true);
    await _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: widget.backgroundColor,
      borderRadius: BorderRadius.circular(32),
    );

    return FutureBuilder<void>(
      future: _initializeVideoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildVideoPlayer(decoration, context);
        } else {
          return _buildShimmer(decoration, context);
        }
      },
    );
  }

  Widget _buildVideoPlayer(BoxDecoration decoration, BuildContext context) {
    return Container(
      decoration: decoration.withBoxShadow(AtomShadowStyle.categoryHeader),
      height: ResponsiveService.isMobile(context) ? 224 : 272,
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
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

  Widget _buildShimmer(BoxDecoration decoration, BuildContext context) {
    return Container(
      decoration: decoration.copyWith(
        boxShadow: AtomShadowStyle.categoryHeader,
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: ResponsiveService.isMobile(context) ? 256 : 272,
          width: MediaQuery.of(context).size.width,
          decoration: decoration,
        ),
      ),
    );
  }
}
