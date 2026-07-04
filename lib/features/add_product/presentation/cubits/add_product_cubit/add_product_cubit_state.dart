part of 'add_product_cubit.dart';

abstract class AddProductCubitState {}

final class AddProductCubitInitial extends AddProductCubitState {}

class AddProductCubitLoading extends AddProductCubitState {}

class AddProductCubitFailure extends AddProductCubitState {
  final String errMessage;
  AddProductCubitFailure({required this.errMessage});
}

class AddProductCubitSuccess extends AddProductCubitState {}
