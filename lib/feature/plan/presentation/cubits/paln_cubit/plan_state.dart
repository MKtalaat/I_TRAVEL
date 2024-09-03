import 'package:i_travel/feature/plan/data/models/plan_model.dart';

abstract class PlanState {}

class PlanInitialState extends PlanState {}

class AddPlanLoadingState extends PlanState {}

class AddPlanSuccessState extends PlanState {
  final String message;

  AddPlanSuccessState(this.message);
}

class AddPlanFailureState extends PlanState {
  final String error;

  AddPlanFailureState(this.error);
}

class GetPlanLoadingState extends PlanState {}

class GetPlanSuccessState extends PlanState {
  final List<PlanModel> plan;

  GetPlanSuccessState(this.plan);
}

class GetPlanFailureState extends PlanState {
  final String error;

  GetPlanFailureState(this.error);
}

class DeletePlanLoadingState extends PlanState {}

class DeletePlanSuccessState extends PlanState {
  final String message;

  DeletePlanSuccessState(this.message);
}

class DeletePlanFailureState extends PlanState {
  final String error;

  DeletePlanFailureState(this.error);
}