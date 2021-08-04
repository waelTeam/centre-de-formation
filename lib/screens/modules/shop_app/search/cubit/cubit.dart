import 'package:centredeformation/screens/models/shop_app/search_model.dart';
import 'package:centredeformation/screens/modules/shop_app/search/cubit/states.dart';
import 'package:centredeformation/screens/shared/components/constants.dart';
import 'package:centredeformation/screens/shared/network/end_points.dart';
import 'package:centredeformation/screens/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:centre_for_training/models/shop_app/search_model.dart';
// import 'package:centre_for_training/modules/shop_app/search/cubit/states.dart';
// import 'package:centre_for_training/shared/components/constants.dart';
// import 'package:centre_for_training/shared/network/end_points.dart';
// import 'package:centre_for_training/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
