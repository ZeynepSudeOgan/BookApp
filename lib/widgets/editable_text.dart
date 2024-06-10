import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditableTextField extends StatefulWidget {
  String initialText;
  String variableName;
  bool obscureText;
  Function(String text) onEdit;
  EditableTextField(
      {super.key,
      required this.variableName,
      required this.initialText,
      required this.onEdit,
      this.obscureText = false});

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  late TextEditingController controller;
  late bool obscureText;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
    controller.text = widget.initialText;
    obscureText = widget.obscureText;
  }

  bool isEditingMode = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${widget.variableName}: "),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              obscureText: obscureText,
              onChanged: widget.onEdit,
              controller: controller,
              enabled: isEditingMode,
            ),
          ),
        ),
        if (widget.obscureText)
          IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon:
                  Icon(obscureText ? Icons.visibility : Icons.visibility_off)),
        IconButton(
            onPressed: () {
              setState(() {
                isEditingMode = !isEditingMode;
                widget.onEdit(controller.text);
              });
            },
            icon: const Icon(Icons.edit)),
      ],
    );
  }
}
