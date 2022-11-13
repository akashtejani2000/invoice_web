part of '../widgets.dart';
/*
class DropDownItem<T> {
  String label;
  T value;

  DropDownItem({required this.label, required this.value});
}

class CommonDropDownField<T> extends StatelessWidget {
  final List<DropDownItem<T>> items;
  final String hintText;
  final String labelText;
  final FormFieldValidator<T>? validator;
  final GlobalKey<FormFieldState>? key;
  final ValueChanged<T>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<T?> onChanged;
  final T? value;
  final bool isExpanded;
  final bool hasLabel;
  final Color? fillColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const CommonDropDownField({
    required this.items,
    required this.onChanged,
    this.hintText = "",
    this.key,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.value,
    this.isExpanded = true,
    this.labelText = "",
    this.hasLabel = true,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var borderRadius = this.borderRadius ?? BorderRadius.circular(context.selectResource(japan: 8, canada: 32)!);
    var fillColor = this.fillColor ?? context.selectResource(japan: AppColor.greyLight) ?? AppColor.transparent;
    var borderColor = this.borderColor ?? context.selectResource(canada: AppColor.textField) ?? AppColor.transparent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) ...[
          CommonText.medium(labelText, size: 15, color: AppColor.textPrimaryLight),
          SizeBoxH(8),
        ],
        DropdownButtonFormField<T>(
          key: key,
          value: value,
          validator: validator,
          focusNode: focus,
          onChanged: onChanged,
          style: GoogleFonts.ptSans(
            color: AppColor.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.5,
          ),
          isExpanded: isExpanded,
          icon: SquareSvgImageFromAsset(AppImage.dropDownIcon, size: 6, color: AppColor.grey),
          items: items
              .map((e) => DropdownMenuItem<T>(child: CommonText.medium(e.label, size: 16), value: e.value))
              .toList(),
          dropdownColor: AppColor.white,
          hint: CommonText.medium(hintText, size: 16, color: AppColor.textPrimaryLight, textAlign: TextAlign.center),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
              borderSide: BorderSide(color: context.themeData.primaryColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: AppColor.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: AppColor.red, width: 1.5),
            ),
            errorStyle: GoogleFonts.ptSans(color: AppColor.red, fontWeight: FontWeight.w500, fontSize: 12, height: 1.5),
            hintText: hintText,
            hintStyle: GoogleFonts.ptSans(
                color: AppColor.textPrimaryLight, fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
            fillColor: fillColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}*/
