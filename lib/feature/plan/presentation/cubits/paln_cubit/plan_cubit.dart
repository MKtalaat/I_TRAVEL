import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';
import 'package:i_travel/feature/plan/data/repository/plan_repository.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit(this.planRepository) : super(PlanInitialState());

  final PlanRepository planRepository;

  static PlanCubit get(context) => BlocProvider.of(context);

  Future<void> addPlan({
    required PlanModel planModel,
  }) async {
    emit(AddPlanLoadingState());
    Either<Failure, String> result = await planRepository.addPlan(
   planModel: planModel,
    );
    result.fold((failure) {
      emit(AddPlanFailureState(failure.error));
    }, (message) {
      emit(AddPlanSuccessState(message));
    });
  }

  List<PlanModel> plan = [];

  Future<void> getPlan() async {
    emit(GetPlanLoadingState());
    Either<Failure, List<PlanModel>> result = await planRepository.getPlan();
    result.fold((failure) {
      emit(GetPlanFailureState(failure.error));
    }, (plan) {
      this.plan = plan;
      emit(GetPlanSuccessState(plan));
    });
  }
}
