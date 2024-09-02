import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_state.dart';


class DatePickerTimeLine extends StatelessWidget {
  const DatePickerTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<ItemDetailsCubit,ItemDetailsState>(
      builder: (context, state) {
        return Padding(
          padding:  const EdgeInsets.symmetric(vertical: 5),
          child: DatePicker(
            DateTime.now(),
            height: 90.h,
            width: 60.w,
            initialSelectedDate: DateTime.now(),
            selectedTextColor: AppColors.white,
            selectionColor: AppColors.primary,
            onDateChange: (newDate) {
              ItemDetailsCubit.get(context).selectDateTimeLine(newDate);
            },
            dayTextStyle: AppStyles.styleSemiBold16Black.copyWith(
              color: Colors.grey,
            ),
            dateTextStyle: AppStyles.styleSemiBold20Grey,
            monthTextStyle: AppStyles.styleSemiBold14Grey,
          ),
        );
      },
    );
  }
}