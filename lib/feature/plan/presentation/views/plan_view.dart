import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_back_button.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/plan/presentation/views/widgets/plan_view_body.dart';

class PlanView extends StatefulWidget {
  const PlanView({super.key});

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {

  @override
  void initState() {
    PlanCubit.get(context).getPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.plan),
      ),
      body: const PlanViewBody(),
    );
  }
}
