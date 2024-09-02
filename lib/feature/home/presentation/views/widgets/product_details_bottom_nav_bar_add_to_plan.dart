import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_state.dart';
import 'package:intl/intl.dart';

class ProductDetailBottomNavBarAddToPlan extends StatelessWidget {
  const ProductDetailBottomNavBarAddToPlan({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit, PlanState>(
      listener: (context, state) {
        if (state is AddPlanSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is AddPlanFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Column(
              children: [
                Text(
                  '${item.price} EGP',
                  style: AppStyles.styleRegular18White.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Price',
                  style: AppStyles.styleRegular15Grey.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: AppConstants.size10w,
            ),
            Expanded(
              child: GradientButton(
                onPressed: () {
                  InternetConnectionCubit.get(context)
                      .checkInternetConnection()
                      .then((value) {
                    if (InternetConnectionCubit.get(context).isInternet) {
                      PlanCubit.get(context)
                          .addPlan(
                        planModel: PlanModel(
                          id: '',
                          name: item.name,
                          image: item.images[0],
                          address: item.address,
                          price: item.price,
                          date: DateFormat.yMMMd().format(DateTime.parse(
                              ItemDetailsCubit.get(context)
                                  .selectedDateTimeLine
                                  .toString())),
                        ),
                      )
                          .then((value) {
                        PlanCubit.get(context).getPlan();
                      });
                    }else{
                      showErrorSnackBar(
                          context: context,
                          message: AppStrings.noInternetTitle);
                    }
                  });
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.addToPlan,
                      style: AppStyles.styleRegular18White,
                    ),
                    SizedBox(
                      width: AppConstants.size5w,
                    ),
                    Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                      size: AppConstants.iconSize22,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
