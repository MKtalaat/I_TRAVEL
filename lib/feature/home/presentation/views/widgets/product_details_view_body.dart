import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/slider_details_list_view.dart';


class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key,  required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: Stack(
        children: [
          SliderDetailsListView(
            item: item,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppConstants.size15h, top: 33.h),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.25),
                radius: AppConstants.radius20r,
                child: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.white,
                  size: AppConstants.iconSize23,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
