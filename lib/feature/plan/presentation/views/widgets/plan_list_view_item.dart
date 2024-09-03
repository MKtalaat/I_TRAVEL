import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/core/widgets/custom_slidable.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_state.dart';

class PlanListViewItem extends StatelessWidget {
  const PlanListViewItem({super.key, required this.plan});

  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit,PlanState>(
      listener: (context, state) {
        if (state is DeletePlanSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is DeletePlanFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return CustomSlidable(
          delete: (context){
            PlanCubit.get(context).deletePlan(id: plan.id);
          },
          child: Container(
            padding:  EdgeInsets.all(AppConstants.size10h),
            height: 90.h,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
            ),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CustomNetworkImage(
                    image: plan.image,
                  ),
                ),
                SizedBox(
                  width: AppConstants.size5w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleBold16Black,
                      ),
                      Row(
                        children: [
                          Icon(
                            IconBroken.Location,
                            color: AppColors.redAccent,
                            size: AppConstants.iconSize18,
                          ),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              plan.address,
                              style: AppStyles.styleRegular15Grey.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                IconBroken.Calendar,
                                color: AppColors.primary,
                                size: AppConstants.iconSize18,
                              ),
                              Text(
                                plan.date,
                                style: AppStyles.styleRegular15Grey.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${plan.price} EGP',
                            style: AppStyles.styleRegular15Grey.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
