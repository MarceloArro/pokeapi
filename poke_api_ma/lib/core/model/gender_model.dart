import 'package:equatable/equatable.dart';

class GenderRatioModel extends Equatable {
  const GenderRatioModel({
    required this.maleRatio,
    required this.femaleRatio,
  });

  final double maleRatio;
  final double femaleRatio;

  @override
  List<Object> get props => [
        maleRatio,
        femaleRatio,
      ];
}
