import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_back_button.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/restaurants_view_body.dart';

class RestaurantsView extends StatelessWidget {
  const RestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.restaurants),
      ),
      body: const RestaurantsViewBody(),
    );
  }
}
