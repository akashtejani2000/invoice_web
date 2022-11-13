import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

typedef CountryPickerTapCallback = void Function(Country country);

class CountryPickerItemView extends StatelessWidget {
  final Country country;
  final CountryPickerTapCallback onPressed;

  const CountryPickerItemView({
    Key? key,
    required this.country,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context);

    return ListTile(
      hoverColor: colorScheme.primary.withOpacity(0.05),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: CountryPickerUtils.getDefaultFlagImage(country),
      ),
      horizontalTitleGap: 8,
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: FittedBox(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.scaleDown,
              child: Text("+${country.phoneCode}", style: textTheme.titleMedium),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Text(
              country.nameTranslations[locale.languageCode] ?? country.name,
              style: textTheme.titleMedium,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pop(country);
      },
    );
  }
}
