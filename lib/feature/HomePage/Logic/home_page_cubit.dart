import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repo/Model.dart';
import '../repo/Repo.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final Repository repository = Repository();
  late final Stream<BatteryInfo> _batteryInfoStream;

  HomePageCubit() : super(HomePageLoading()) {
    _initialize();
  }

  void _initialize() {
    _batteryInfoStream = repository.getBatteryInfoStream(); // Use stream from repository
    _batteryInfoStream.listen((batteryInfo) {
      if (batteryInfo == null) {
        emit(HomePageError(error: "No Data Found"));
      } else {
        emit(HomePageSuccess(batteryInfo: batteryInfo));
      }
    }).onError((error) {
      emit(HomePageError(error: error.toString()));
    });
  }
}
