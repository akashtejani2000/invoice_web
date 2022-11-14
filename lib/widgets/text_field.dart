part of 'widgets.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscure;
  final String obscureCharacter;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter> inputFormatters;
  final List<String> autofillHints;
  final bool isReadOnly;
  final bool hasLabel;
  final TextAlign textAlign;
  final Widget? icon;
  final Color labelColor;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const CommonTextField({super.key,
    required this.controller,
    this.labelText = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.obscureCharacter = "•",
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.autofillHints = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.isReadOnly = false,
    this.hasLabel = true,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.icon,
    this.labelColor = AppColor.primary,
    this.onTap,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
  }) : _fieldKey = globalKey;

  @override
  Widget build(BuildContext context) {
    var borderRadius = this.borderRadius ??
        BorderRadius.circular(8);
    var fillColor =  AppColor.colorSecondaryDark;
    var borderColor = AppColor.transparent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) ...[
          CommonText.medium(labelText, size: 15, color: labelColor),
          const SizeBoxH(8),
        ],
        TextFormField(
          onTap: onTap,
          key: _fieldKey,
          validator: validator,
          obscuringCharacter: obscureCharacter,
          textInputAction: inputAction,
          onFieldSubmitted: fieldSubmitted,
          controller: controller,
          focusNode: focus,
          autofillHints: isReadOnly ? null : autofillHints,
          obscureText: obscure,
          onChanged: onChanged,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: AppColor.colorSecondaryDark, fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
          textAlign: textAlign,
          maxLines: maxLines,
          minLines: minLines,
          readOnly: isReadOnly,
          cursorColor: AppColor.primary,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(color: AppColor.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(color: AppColor.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(color: AppColor.error, width: 1.5),
            ),
            errorStyle: const TextStyle(color: AppColor.error, fontWeight: FontWeight.w500, fontSize: 12, height: 1.5),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: AppColor.colorSecondaryDark, fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
            prefix: prefix,
            suffix: suffix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            icon: icon,
            prefixIconConstraints: const BoxConstraints(maxWidth: 120),
            fillColor: fillColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}
