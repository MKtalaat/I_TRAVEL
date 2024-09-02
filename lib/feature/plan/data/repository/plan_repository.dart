import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';

abstract class PlanRepository{


  Future<Either<Failure,String>>addPlan({
    required PlanModel planModel,
});
  Future<Either<Failure,List<PlanModel>>>getPlan();


}