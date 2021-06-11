import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/helper/size_config.dart';

class CommonTextControllers {
  CommonTextControllers._();

  static final CommonTextControllers _instance = CommonTextControllers._();

  factory CommonTextControllers() => _instance;

  Widget customTextField(
      {TextEditingController? controller,
      validator,
      bool? withBorder,
      String? labelText,
      Widget? suffix,
      Widget? prefix,
      bool? isObscureText,
      double? height,
      double? width,
      BorderRadius? borderRadius,
      double? fontSize,
      Color? textFieldColor,
      Color? fontColor,
      Color? borderColor,
      Color? fillColor,
      int? maxLines,
      onChanged,
      VoidCallback? onPrefixPressVCL,
      VoidCallback? onSuffixPressVCL,
      TextInputType? keyboardType,
      FontWeight? fontWeight,
      TextStyle? hintStyle,
      EdgeInsets? containerPadding,
      enabledBorder,
      focusedBorder,
      GlobalKey<FormFieldState>? formKey,
      FocusNode? focusNode,
      onSubmitted,
      String? language,
      bool inHome = false,
      bool inTam = false,
      bool? readOly,
      List<TextInputFormatter>? inputFormatter}) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Color(0xFFbbbbbb),
          width: 1,
        ));
    return Container(
      width: width ?? SizeConfig().safeBlockHorizontal! * .2,
      height: height ?? SizeConfig().safeBlockHorizontal! * 8,
      child: TextFormField(
        readOnly: readOly == null ? false : readOly,

        key: formKey,
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isObscureText ?? true,
        controller: controller,
        maxLines: maxLines ?? 1,
        textInputAction: TextInputAction.next,
//language=='ar'? TextAlign.end:TextAlign.start
        textAlignVertical: TextAlignVertical.top,

        textAlign: TextAlign.start,
        style: TextStyle(
            //color: AppColors.
            ),
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: Colors.blue,
        onFieldSubmitted: onSubmitted,
        decoration: withBorder == true
            ? InputDecoration(
                contentPadding:
                    const EdgeInsetsDirectional.only(top: 2.0, start: 10),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(8.0),
                  ),
                ),
                disabledBorder: border,
                enabledBorder: border,
                focusedBorder: border,

                //border: hasBorder ? border : noBorder,
                labelText: labelText,
                labelStyle: TextStyle(
                    fontFamily: "Montserrat-Medium",
                    color: Color(0xFF707070),
                    fontSize: SizeConfig().fontSize15,
                    fontWeight: FontWeight.w400),
                hintStyle: TextStyle(
                    fontFamily: "Montserrat-Medium",
                    color: Color(0xFF707070),
                    fontSize: SizeConfig().fontSize15,
                    fontWeight: FontWeight.w400),
                errorMaxLines: 2,
                errorStyle: TextStyle(
                    color: Colors.red, fontSize: SizeConfig().fontSize12),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.red,
                      width: 1,
                    )))
            : InputDecoration(
                // contentPadding: const EdgeInsetsDirectional.only(top: 2.0, start: 10 ,end: 0),
                labelText: labelText ?? '',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold,

                  fontSize: SizeConfig().fontSize13,
                ),
                // suffixIcon: suffix != null
                //     ? GestureDetector(
                //     onTap: onSuffixPressVCL,
                //     child: Padding(
                //       padding: EdgeInsets.all(SizeConfig().safeBlockHorizontal * 0),
                //       child: suffix,
                //     ))
                //     : Container(
                //   width: 0,
                //   height: 0,
                // ),
                // prefixIcon: prefix != null
                //     ? GestureDetector(onTap: onPrefixPressVCL, child: prefix)
                //     : Container(
                //   width: 0,
                //   height: 0,
                // ),

                border: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),

                focusedBorder: focusedBorder ??
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                hintStyle: hintStyle ??
                    TextStyle(
                      color: fontColor ?? Colors.grey,
                      fontSize: fontSize ?? SizeConfig().fontSize14,
                      fontWeight: fontWeight ?? FontWeight.w400,
                    ),
                errorMaxLines: 2,
                errorStyle: TextStyle(
                    color: Colors.red, fontSize: SizeConfig().fontSize12),
                errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )),
              ),
      ),
    );
  }
}
