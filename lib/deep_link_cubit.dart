import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links3/uni_links.dart';

// Cubit to manage deep links
class AppLinkCubit extends Cubit<Uri?> {
  StreamSubscription<String?>? _sub;

  AppLinkCubit() : super(null) {
    _sub = linkStream.listen((String? link) {
      log(link!);
      emit(Uri.parse(link)); // Emit the parsed URI
        });
  }

  // Handle the deep link and clear state after usage
  void clearLink() => emit(null);

  @override
  Future<void> close() {
    _sub?.cancel(); // Cancel the subscription when cubit is disposed
    return super.close();
  }
}
