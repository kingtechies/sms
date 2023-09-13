import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SmsReceiver extends StatefulWidget {
  const SmsReceiver({Key? key}) : super(key: key);

  @override
  State<SmsReceiver> createState() => _SmsReceiverState();
}

class _SmsReceiverState extends State<SmsReceiver> {
  late SmsReceiverPlugin smsReceiverPlugin;

  @override
  void initState() {
    super.initState();
    smsReceiverPlugin = SmsReceiverPlugin();
    smsReceiverPlugin.onSmsReceived.listen((SmsMessage message) {
      // Check if the sender's number matches a short number to block (e.g., 121, 131, 141, 777)
      if (isShortNumber(message.address)) {
        // Block the message (you may choose to silently discard it or take other actions)
        smsReceiverPlugin.cancelSms(message.messageId);
      }
    });
  }

  @override
  void dispose() {
    smsReceiverPlugin.dispose();
    super.dispose();
  }

  private bool isShortNumber(String sender) {
    // Define a list of short numbers to block
    List<String> shortNumbersToBlock = [
      
      "131",
      "127",
      "141",
      "312",
      "323",
      "131",
      "127",
      "228",
      "232",
      "929",
      "229",
      "323",
      "140",
      "127",
      "777",
      "55015",
    ];
    return shortNumbersToBlock.contains(sender);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
