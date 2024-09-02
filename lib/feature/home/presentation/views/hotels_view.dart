import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_back_button.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/hotels_view_body.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.hotels),
      ),
      body: const HotelsViewBody(),
    );
  }
}
