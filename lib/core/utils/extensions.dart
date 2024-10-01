
import 'package:flutter/material.dart';

extension VerticalSizedBoxExtension on num {
  Widget get verticalSizedBox {
    return SizedBox(
      height: toDouble(),
    );
  }
}

extension HorizontalSizedBoxExtension on num {
  Widget get horizontalSizedBox {
    return SizedBox(
      width: toDouble(),
    );
  }
}
