import 'dart:convert';
import 'result.dart';


class ResultObj {
  static Result fromat(response) {
    return Result.fromJson(response);
  }
}