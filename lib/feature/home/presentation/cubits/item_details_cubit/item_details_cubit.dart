import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>{
  ItemDetailsCubit():super(ItemDetailsInitialState());

  static ItemDetailsCubit get(BuildContext context)=>BlocProvider.of(context);

  int currentIndex = 0;

  void changeSliderIndex({required int index}){
    currentIndex = index;
    emit(ChangeSliderIndexState());
  }

  DateTime selectedDateTimeLine = DateTime.now();

  void selectDateTimeLine(newDate){
    selectedDateTimeLine= newDate;
    emit(SelectDateTimeLineState());
  }
}