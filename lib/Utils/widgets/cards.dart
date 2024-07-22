import 'package:paytogo/Utils/widgets/bottom_sheet_page.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../../UI/authentication/data/countries_list.dart';

class SelectCountryCard extends StatefulWidget {
  const SelectCountryCard({
    super.key,
    required this.addSelectedCountry,
    required this.country,
  });
  final String country;
  final void Function(String value) addSelectedCountry;

  @override
  State<SelectCountryCard> createState() => _SelectCountryCardState();
}

class _SelectCountryCardState extends State<SelectCountryCard> {
  String country = '';
  @override
  void initState() {
    super.initState();
  }

  void showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BottomSheetPage(
        title: 'Select Your Country',
        widgets: [
          ...countries.map(
            (country) => ListTile(
              dense: true,
              title: Text(
                country,
                style: ThemeTextStyle.bodyLarge(context),
              ),
              onTap: () {
                country = country;
                widget.addSelectedCountry(country);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your country',
                style: ThemeTextStyle.bodyMedium(
                  context,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                ),
              ),
              Text(
                widget.country,
                style: ThemeTextStyle.bodyMedium(context, bold: true),
              )
            ],
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              showCountryPicker(context);
            },
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ],
      ),
    );
  }
}
