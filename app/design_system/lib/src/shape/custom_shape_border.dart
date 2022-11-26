import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomShapeBorder extends ShapeBorder {
  final int horizontalPadding; // must be of type int, otherwise responsiveness is lost
  const CustomShapeBorder({required this.horizontalPadding});

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    final Size size = rect.size;
    final topGap = rect.top;
    final width = rect.width;

    const int peakWidth = 16; // must be of type int, otherwise responsiveness is lost
    const peakHeight = 6;
    double cornerWidth = 24.807272;

    final double remainedSpace = (width - 2 * cornerWidth - 2 * horizontalPadding) % peakWidth;
    cornerWidth += remainedSpace / 2;

    var numberOfPeaks = (width - 2 * cornerWidth - 2 * horizontalPadding) / peakWidth;

    final startingPointX = width - horizontalPadding;
    final startingPointY = 2.666665371 * peakHeight + topGap;

    Size coordinate = Size(startingPointX, startingPointY);

    double OX(double moveBy){
      double xCoordinate = coordinate.width;
      final yCoordinate = coordinate.height;

      xCoordinate += moveBy;

      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.width;
    }
    double OY(double moveBy){
      final xCoordinate = coordinate.width;
      double yCoordinate = coordinate.height;

      yCoordinate += moveBy;
      coordinate = Size(xCoordinate, yCoordinate);
      return coordinate.height;
    }


    final Path path = Path();

    /// From top right to left <-
    path.moveTo(coordinate.width, coordinate.height);

    path.cubicTo(
      OX(-0.297528402 * cornerWidth), coordinate.height,
      OX(-0.227212408 * cornerWidth), OY(-1.193903575*peakHeight),
      coordinate.width, OY(-1.472761797*peakHeight),
    );

    path.lineTo(OX(-0.271571981 * cornerWidth), coordinate.height);

    path.cubicTo(
      coordinate.width, OY(0.552285512*peakHeight),
      OX(-0.091191164 * cornerWidth), OY(0.447714488*peakHeight),
      OX(-0.112496046 * cornerWidth), coordinate.height,
    );
    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        OX(-0.165690657 * peakWidth), coordinate.height,
        OX(-0.134313332 * peakWidth), OY(-0.447714488*peakHeight),
        coordinate.width, OY(-0.552285512*peakHeight),
      );
      path.lineTo(
        OX(-0.39999202 * peakWidth), coordinate.height,
      );
      path.cubicTo(
        coordinate.width, OY(0.552285512*peakHeight),
        OX(-0.134313332 * peakWidth), OY(0.447714488*peakHeight),
        OX(-0.165690657 * peakWidth), coordinate.height,
      );
    }

    path.cubicTo(
      OX(-0.112496046 * cornerWidth),coordinate.height,
      OX(-0.091191164 * cornerWidth),OY(-0.447714488*peakHeight),
      coordinate.width, OY(-0.552285512*peakHeight),
    );

    path.lineTo(OX(-0.271571981 * cornerWidth), coordinate.height,);

    path.cubicTo(
      coordinate.width, OY(1.416780324*peakHeight),
      OX(-0.227212408 * cornerWidth),OY(1.158723621*peakHeight),
      OX(-0.297528402 * cornerWidth),OY(0.091161427*peakHeight),
    );

    path.lineTo(OX(horizontalPadding - coordinate.width), coordinate.height);

    /// From top left to bottom left |
    path.lineTo(coordinate.width,OY(size.height - 2.666665371 * peakHeight + topGap - coordinate.height));

    /// From bottom left to right ->
    path.cubicTo(
      OX(0.297528402 * cornerWidth),coordinate.height,
      OX(0.227212408 * cornerWidth),OY(1.193911346*peakHeight),
      coordinate.width,OY(1.472763092*peakHeight),
    );
    path.lineTo(OX(0.271571981 * cornerWidth), coordinate.height);
    path.cubicTo(
      coordinate.width, OY(-0.552198731*peakHeight),
      OX(0.091191164 * cornerWidth),OY(-0.447802564*peakHeight),
      OX(0.112496046 * cornerWidth),coordinate.height,
    );

    for(int i = 0; i < numberOfPeaks; i++){
      path.cubicTo(
        OX(0.165690657 * peakWidth), coordinate.height,
        OX(0.134313332 * peakWidth), OY(0.447802564*peakHeight),
        coordinate.width, OY(0.552198731*peakHeight),
      );

      path.lineTo(
        OX(0.39999202 * peakWidth), coordinate.height,
      );


      path.cubicTo(
        coordinate.width, OY(-0.552198731*peakHeight),
        OX(0.134313332 * peakWidth), OY(-0.447802564*peakHeight),
        OX(0.165690657 * peakWidth), coordinate.height,
      );
    }


    path.cubicTo(
      OX(0.112496046 * cornerWidth),coordinate.height,
      OX(0.091191164 * cornerWidth),OY(0.447802564*peakHeight),
      coordinate.width,OY(0.552198731*peakHeight),
    );
    path.lineTo(OX(0.271571981 * cornerWidth),coordinate.height);
    path.cubicTo(
      coordinate.width,OY(-1.416769962*peakHeight),
      OX(0.227212408 * cornerWidth),OY(-1.158654973*peakHeight),
      OX(0.297528402 * cornerWidth),OY(-0.086094457*peakHeight),
    );

    path.lineTo(OX(startingPointX - coordinate.width),OY(-0.005155046*peakHeight));

    /// From bottom right to top right
    path.lineTo(coordinate.width,OY(startingPointY - coordinate.height));

    path.close();

    return path;
  }

  @override
  void paint(ui.Canvas canvas, ui.Rect rect, {ui.TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}