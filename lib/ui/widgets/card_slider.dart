import 'dart:async';

import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  final int itemCount;
  final int initialIndex;
  final IndexedWidgetBuilder itemBuilder;
  final ValueSetter<int>? onCardChanged;
  final double gap;

  CardSlider({
    required this.itemBuilder,
    required this.itemCount,
    this.initialIndex = 0,
    this.onCardChanged,
    this.gap = 16.0,
  })  : assert(itemCount >= 2 && itemCount <= 8),
        assert(initialIndex < itemCount && initialIndex >= 0);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> with SingleTickerProviderStateMixin {
  int _visibleCardIndex = 0;
  int _length = 0;
  late ScrollController _scrollController;
  late List<Widget> _listCard;
  late AnimationController _animationController;

  @override
  void initState() {
    _visibleCardIndex = widget.initialIndex;
    _length = widget.itemCount;
    _scrollController = ScrollController();
    _animationController = AnimationController(
        vsync: this, value: 0.0, upperBound: 1.0, lowerBound: 0.0, duration: Duration(milliseconds: 500))
      ..forward();
    _listCard = _buildCards();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CardSlider oldWidget) {
    if (widget.itemCount != _length) {
      _visibleCardIndex = 0;
      _length = widget.itemCount;
      widget.onCardChanged?.call(_visibleCardIndex);
      _animationController.forward(from: 0.0);
    }
    _listCard = _buildCards();
    super.didUpdateWidget(oldWidget);
  }

  List<Widget> _buildCards() {
    return List.generate(_length, (index) => widget.itemBuilder.call(context, index));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var cardWidth = constraints.maxWidth - (_length * widget.gap);

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.topCenter,
              children: [
                for (int index = 0; index < _length; index++)
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    margin: EdgeInsetsDirectional.only(
                      end:
                          index == _length - 1 ? 0 : ((widget.gap * _animationController.value) + (index * widget.gap)),
                    ),
                    child: index == _length - 1
                        ? NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollEndNotification) {
                                if (notification.metrics.pixels > cardWidth / 2) {
                                  Timer.run(() {
                                    if (!_animationController.isAnimating) {
                                      _visibleCardIndex = (_visibleCardIndex + 1) % _length;
                                      widget.onCardChanged?.call(_visibleCardIndex);
                                    }
                                    _scrollController
                                        .animateTo(cardWidth, duration: Duration(milliseconds: 300), curve: Curves.ease)
                                        .whenComplete(() {
                                      if (!_animationController.isAnimating) {
                                        _animationController.forward(from: 0.0);
                                        _scrollController.jumpTo(0);
                                      }
                                    });
                                  });
                                } else {
                                  Timer.run(() => _scrollController.animateTo(0,
                                      duration: Duration(milliseconds: 300), curve: Curves.ease));
                                }
                              }
                              return false;
                            },
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                alignment: AlignmentDirectional.centerStart,
                                width: (constraints.maxWidth * 2) - (_length * widget.gap),
                                child: Container(
                                  width: cardWidth - (widget.gap),
                                  alignment: AlignmentDirectional.centerEnd,
                                  margin: EdgeInsetsDirectional.only(
                                      start: (widget.gap * 2) - (widget.gap * _animationController.value)),
                                  child: Transform.scale(
                                    scale: 1.0 - ((_length - (index + _animationController.value)) * 0.10),
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: _listCard[((_length - _visibleCardIndex) + index) % _length],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: cardWidth,
                            child: Transform.scale(
                              scale: 1.0 - ((_length - (index + _animationController.value)) * 0.10),
                              alignment: AlignmentDirectional.centerEnd,
                              child: _listCard[((_length - _visibleCardIndex) + index) % _length],
                            ),
                          ),
                  )
              ],
            );
          },
        );
      },
    );
  }
}
