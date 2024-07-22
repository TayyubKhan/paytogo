import 'package:flutter/material.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/text_form_field.dart';

import '../../Utils/widgets/text_styles.dart';

class HelpTemplateScreen extends StatefulWidget {
  static const routeName = '/help_template';
  const HelpTemplateScreen({
    super.key,
    required this.title,
    required this.onConfirm,
  });
  final String title;
  final void Function() onConfirm;

  @override
  State<HelpTemplateScreen> createState() => _HelpTemplateScreenState();
}

class _HelpTemplateScreenState extends State<HelpTemplateScreen> {
  bool transactions = true;
  bool communication = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
          title: Text(widget.title),
          leading: const LeadingButton(),
          actions: [
            IconButton(
              onPressed: widget.onConfirm,
              icon: const Icon(Icons.check_rounded, size: 18),
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('How can we help?',
                              style: ThemeTextStyle.bodyLarge(context,
                                  bold: true)),
                          Text('Provide details..',
                              style: ThemeTextStyle.bodySmall(context)),
                        ],
                      ),
                    ),
                    const MultiLineTextField(
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.02),
              Row(
                children: [
                  const Icon(Icons.info_outline_rounded, size: 18),
                  const SizedBox(width: 5),
                  Text('Specific details help us assist you more quickly  ',
                      style: ThemeTextStyle.bodySmall(context))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
