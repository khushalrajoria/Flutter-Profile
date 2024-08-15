import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import 'svg_loader.dart';


Widget NavigationMenu(icon, {isSelected = false, height, width,onClick}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          svgLoader(icon, height: height, width: width),
          Container(
            margin: const EdgeInsets.all(8),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: isSelected && mode?  darknavigationSelectionColor : isSelected && !mode? navigationSelectionColor : !isSelected ?Colors.transparent:Colors.transparent,
            ),
          )
        ],
      ),
    ),
  );
}
