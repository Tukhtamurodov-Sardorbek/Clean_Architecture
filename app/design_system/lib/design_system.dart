library design_system;

import 'dart:ui';

export 'package:animated_flip_counter/animated_flip_counter.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:easy_refresh/easy_refresh.dart';
export 'package:expandable_page_view/expandable_page_view.dart';
export 'package:flutter_svg/svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
export 'package:logger/logger.dart';
export 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
export 'package:pinput/pinput.dart';
export 'package:readmore/readmore.dart';
export 'package:shimmer/shimmer.dart';
export 'package:sliver_tools/sliver_tools.dart';

export 'src/colors/palette.dart';
export 'src/decoration/box_decoration.dart';
export 'src/extensions/context.dart';
export 'src/extensions/date_time.dart';
export 'src/shape/custom_shape_border.dart';
export 'src/style/text_style.dart';
export 'src/theme/app_theme.dart';

class DesignConstants {
  static const double defaultButtonHeight = 54;
  static const double appCornerRadius = 12;
  static const double inputCornerRadius = 16;
  static const double shadowBlurRadius = 12;
  static const Offset shadowOffset = Offset(0, 4);
  static const double buttonMaxWidth = 312;
  static const double inputMaxWidth = 306;
  static const double inputFullWidth = 343;

  static const String fontFamily = 'Manrope';
}
