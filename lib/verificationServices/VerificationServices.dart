import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class VerificationServices {
  Future<void> verificationServices(String email, String code) async {
    String text =
        'Your OTP (One-Time Password) for verification is **$code**. Please use this code to complete the verification process. Do not share this code with anyone for security reasons';

   final smtp=gmail('atif765765@gmail.com', 'ewvk upjx lttx enqh');
    final message = Message()
      ..from = const Address('atif765765@gmail.com')
      ..recipients.add(email)
      ..subject = 'Paytogo Verification Code(Don\'t reply)'
      ..text = text;
    try {
      await send(message, smtp);
    } on MailerException catch (e) {
      throw MailerException;
    }
  }
}
