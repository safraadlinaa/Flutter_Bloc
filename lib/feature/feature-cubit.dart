import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureCubit extends Cubit<String> {
  FeatureCubit() : super("");

// capitalise input
  void accetpInput(input) =>
    emit(input.toUpperCase());
  

}
