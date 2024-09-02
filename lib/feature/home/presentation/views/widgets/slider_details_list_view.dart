import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_state.dart';

class SliderDetailsListView extends StatelessWidget {
  const SliderDetailsListView({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: item.images.length,
          itemBuilder: (context, index, n) {
            return CustomNetworkImage(
              borderRadius: 0,
              width: double.infinity,
              height: double.infinity,
              image: item.images[index],
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              ItemDetailsCubit.get(context).changeSliderIndex(index: index);
            },
            height: double.infinity,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
          ),
        );
      },
    );
  }
}
