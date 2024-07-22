import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

import '../../Firebase_Services/Firebase_Auth_Services.dart';
import '../onboarding/widgets/button.dart';

class QRScreen extends StatelessWidget {
  static const routeName = '/qr';
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingButton(
          icon: Icons.close_rounded,
        ),
        title: const Text(
          'Lightning Address',
        ),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  final qrImage = await QrPainter(
                    data: args.title,
                    version: QrVersions.auto,
                  ).toImageData(200);
                  final tempDir = await getTemporaryDirectory();
                  final tempPath = tempDir.path;
                  final qrImagePath = '$tempPath/qr_code.png';
                  final qrImageFile = File(qrImagePath);
                  await qrImageFile.writeAsBytes(qrImage!.buffer.asUint8List());

                  // Share the QR code image file
                  await Share.shareFiles(
                    [qrImagePath],
                    mimeTypes: ['image/png'],
                    text: 'Share QR Code',
                  );
                } catch (e) {
                  print('Error sharing QR code: $e');
                }
              },
              icon: const Icon(Icons.share_rounded))
        ],
      ),
      body: Container(
        height: 300,
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(
            size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: QrImageView(
                data: args.title,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lightning Address',
              style: ThemeTextStyle.bodyLarge(context, bold: true),
            ),
            Text(
              args.title,
              style: ThemeTextStyle.bodySmall(context),
            ),
          ],
        ),
      ),
    );
  }
}
