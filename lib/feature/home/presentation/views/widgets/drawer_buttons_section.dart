import 'package:flutter/material.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/drawer_buttons_section_item.dart';

class DrawerButtonsSection extends StatelessWidget {
  const DrawerButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerButtonsSectionItem(
          title: 'Home',
          icon: IconBroken.Home,
          onTap: () {
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: 'Profile',
          icon: IconBroken.Profile,
          onTap: () {
            Navigator.pushNamed(context, Routes.profileView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: AppStrings.places,
          icon: IconBroken.Location,
          onTap: () {
            Navigator.pushNamed(context, Routes.placesView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: AppStrings.hotels,
          icon: Icons.home_work_outlined,
          iconSize: AppConstants.iconSize19,
          onTap: () {
            Navigator.pushNamed(context, Routes.hotelsView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: AppStrings.restaurants,
          icon: Icons.restaurant_outlined,
          iconSize: AppConstants.iconSize19,
          onTap: () {
            Navigator.pushNamed(context, Routes.restaurantsView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: AppStrings.trips,
          icon: Icons.airplane_ticket_outlined,
          iconSize: AppConstants.iconSize19,
          onTap: () {
            Navigator.pushNamed(context, Routes.tripsView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
        DrawerButtonsSectionItem(
          title: AppStrings.plan,
          icon: Icons.map_outlined,
          iconSize: AppConstants.iconSize19,
          onTap: () {
           Navigator.pushNamed(context, Routes.planView);
            AnimatedDrawerCubit.get(context).closeDrawer();
          },
        ),
      ],
    );
  }
}
