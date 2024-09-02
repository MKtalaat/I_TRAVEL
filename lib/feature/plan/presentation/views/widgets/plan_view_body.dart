import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_empty_widget.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_state.dart';
import 'package:i_travel/feature/plan/presentation/views/widgets/plan_list_view_item.dart';

class PlanViewBody extends StatelessWidget {
  const PlanViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanCubit, PlanState>(
      builder: (context, state) {
        if (PlanCubit.get(context).plan.isNotEmpty) {
          return ListView.separated(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemCount: PlanCubit.get(context).plan.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => PlanListViewItem(
              plan: PlanCubit.get(context).plan[index],
            ),
            separatorBuilder: (context, index) =>
                SizedBox(height: AppConstants.size10h),
          );
        } else {
          return CustomEmptyWidget(
            imagePath: AppAssets.noDataImage,
            title: AppStrings.noPlanTitle,
            subtitle: AppStrings.noPlanSubtitle,
          );
        }
      },
    );
  }
}
