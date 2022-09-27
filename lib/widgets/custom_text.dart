import '../utils/common_import/common_import.dart';

class TextWidget extends Text {
  TextWidget(
      String? text, {
        Key? key,
        Color? color,
        FontWeight? fontWeight,
        double? fontSize,
        double? height,
        int? maxLines,
        TextAlign? textAlign,
        TextDecoration? decoration,
        TextOverflow? textOverflow,
        String? fontFamily,
        TextDirection? textDirection,
      }) : super(
    text ?? '',
    key: key,
    overflow: textOverflow,
    //overflow: TextOverflow.ellipsis,
    textDirection: textDirection,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: decoration,
      height: height,
      fontFamily: fontFamily,
    ),
    textAlign: textAlign,
    maxLines: maxLines,
  );
}
