import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class PassInput extends TextInput {
  const PassInput({Key? key, required String hintText})
      : super(key: key, hintText: hintText);

  @override
  Icon? getPrefixIcon() {
    return const Icon(FeatherIcons.lock);
  }

  @override
  IconButton? getSuffixIcon() {
    return const IconButton(
      icon: Icon(FeatherIcons.eye),
      onPressed: null,
    );
  }
}
