import 'package:flutter/material.dart';
import '../Core/Utils/colors.dart';

class CustomDropdownField extends StatefulWidget {
  final String hint;
  final List<String> options;
  final String? value;
  final ValueChanged<String> onChanged;
  final IconData icon;

  const CustomDropdownField({
    super.key,
    required this.hint,
    required this.options,
    required this.value,
    required this.onChanged,
    required this.icon,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomDropdownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // update local state if parent value changes
    if (oldWidget.value != widget.value) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final fieldHeight = height * 0.063;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      child: InkWell(
        onTap: () => _openSheet(context),
        borderRadius: BorderRadius.circular(width * 0.05),
        child: Container(
          height: fieldHeight,
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          decoration: BoxDecoration(
            color: AppColors.textfieldfillColor,
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(width * 0.015),
                padding: EdgeInsets.all(width * 0.015),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Icon(widget.icon, color: AppColors.white, size: width * 0.04),
              ),
              SizedBox(width: width * 0.02),
              Expanded(
                child: Text(
                  (selectedValue == null || selectedValue!.isEmpty) ? widget.hint : selectedValue!,
                 textAlign: Directionality.of(context) == TextDirection.rtl
                  ? TextAlign.right
                  : TextAlign.left,
                  style: TextStyle(
                    fontSize: width * 0.037,
                    color: (selectedValue == null || selectedValue!.isEmpty) ? Colors.white : Colors.white,
                    
                  ),
                ),
              ),
              Icon(Icons.arrow_drop_down,color: AppColors.white, size: width * 0.08),
            ],
          ),
        ),
      ),
    );
  }

  void _openSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.options.map((opt) {
              return ListTile(
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Text(opt, textAlign: TextAlign.right),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    selectedValue = opt;
                  });
                  widget.onChanged(opt);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
