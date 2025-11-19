import 'package:flutter/material.dart';
import 'package:safarisooqapp/App/modules/auth/register/controllers/register_controller.dart';
import '../../../../../Core/Utils/colors.dart';
import 'package:get/get.dart';

import '../../controllers/verfiy_controller.dart';

class OtpTextField extends StatefulWidget {
  final controller;
  final int length;

  const OtpTextField({
    super.key,
    required this.controller,
    this.length = 6,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

void _onChanged(int index, String value) {
  if (value.isNotEmpty) {
    // Typing a number → move to next field
    if (index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else {
      focusNodes[index].unfocus(); // last field
    }
  } else {
    // Deleting → move to previous field
    if (index > 0) {
      focusNodes[index - 1].requestFocus();
      controllers[index - 1].clear(); // optional: clear previous field
    }
  }

  // Update combined code
  final code = controllers.map((c) => c.text).join();
  widget.controller.setCode(code.toString());

  // Auto-verify if all fields filled
  if (code.length == widget.length) {
    widget.controller.verifyOtp();
  }
}

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    final height = size.height;

    final width = size.width;
    return Directionality(
  textDirection: TextDirection.ltr, // force left-to-right
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(widget.length, (index) {
      return SizedBox(
        width: width * 0.1,
        child: TextField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: AppColors.white.withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          onChanged: (value) => _onChanged(index, value),
        ),
      );
    }),
  ),
);

  
  }
}
