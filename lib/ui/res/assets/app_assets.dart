import 'package:flutter/foundation.dart';

import 'imgs.dart';
import 'svgs.dart';

final $AppAssets = AppAssets();

@immutable
class AppAssets {
  /// Svg files
  final Svgs svgs = Svgs();

  /// All other images
  final Imgs imgs = Imgs();
}
