import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_travel/core/database/database_service.dart';
import 'package:i_travel/core/database/database_strings.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';
import 'package:i_travel/feature/plan/data/repository/plan_repository.dart';

class PlanRepositoryImplementation extends PlanRepository {
  final DatabaseService databaseService;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  PlanRepositoryImplementation(this.databaseService);

   String? planId;

  @override
  Future<Either<Failure, String>> addPlan({
    required PlanModel planModel,
  }) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(AppConstants.userId)
          .collection('Plan')
          .add(planModel.toJson())
          .then((value) async {
            planId= value.id;
        await firebaseFirestore
            .collection('Users')
            .doc(AppConstants.userId)
            .collection('Plan')
            .doc(value.id)
            .update({
          'id': value.id,
        });
      });
      await databaseService.insertRowInToDatabase(
        tableName: DatabaseStrings.planTableName,
        values: {
          DatabaseStrings.planIdColumnName: planId,
          DatabaseStrings.planNameColumnName: planModel.name,
          DatabaseStrings.planImageColumnName: planModel.image,
          DatabaseStrings.planAddressColumnName: planModel.address,
          DatabaseStrings.planPriceColumnName: planModel.price,
          DatabaseStrings.planDateColumnName: planModel.date,
        },
      );
      return const Right('Added to the plan successfully');
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getPlan() async {
    try {
      List<Map<String, dynamic>> data =
          await databaseService.getTableFromDatabase(
        tableName: DatabaseStrings.planTableName,
      );
      List<PlanModel> plan = data.map((element) {
        return PlanModel.fromJson(element);
      }).toList();
      return Right(plan);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePlan({
    required String id,
  }) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(AppConstants.userId)
          .collection('Plan').doc(id).delete().then((value)async{
        await databaseService.deleteRowFromDatabase(
          tableName: DatabaseStrings.planTableName,
          id: id,
        );
      });

      return const Right('Deleted from the plan successfully');
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

}
