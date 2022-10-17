import 'package:flutter/services.dart';

import '../utils/common_import/common_import.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hint, caption;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final int? maxlength;
  final double fontSize;
  final String? Function(String?)? validator;
  final String? prefixText;
  final String? counterText;
  final bool? isPasswordField, hasCaption;
  final bool readOnly;
  final int? maxline;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.focusNode,
    required this.hint,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.textInputAction,
    this.isPasswordField,
    this.hasCaption,
    this.maxlength,
    this.prefixText,
    this.caption,
    required this.fontSize,
    required this.readOnly,
    this.maxline,
    this.counterText,
    this.inputFormatters,
    this.onSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;

  void changeIsShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hasCaption ?? false)
            TextWidget(
              widget.caption ?? '',
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w400,
              color: Color(0xff535353),
            ),
          SizedBox(
            height: 30,
            child: TextFormField(
              controller: widget.controller,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              validator: widget.validator,
              maxLength: widget.maxlength,
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType,
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                  counterText: widget.counterText,
                  hintText: widget.hint,
                  prefixIcon: widget.prefixText != null
                      ? Text(
                          widget.prefixText!,
                          style: TextStyle(fontSize: widget.fontSize),
                        )
                      : null,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE5E5E5))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffE5E5E5), width: 0.75)),
                  contentPadding: EdgeInsets.only(bottom: 10)),
            ),
          ),
          AppSize.size.h30,
        ],
      ),
    );
  }
}
