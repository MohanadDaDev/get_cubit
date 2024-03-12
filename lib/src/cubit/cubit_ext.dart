part of 'get_cubit_impl.dart';

extension GetCubitInstance on Cubit {
  /// delete all the instances of the cubit from [GetCubit]
  void deleteAllInstances() {
    List<String> keys = GetCubit._mp.keys.toList();
    for (int idx = 0; idx < keys.length; idx++) {
      if (keys[idx].contains(runtimeType.toString())) {
        GetCubit._mp[keys[idx]]?.close();
        GetCubit._mp.remove(keys[idx]);
      }
    }
  }

  /// add the current instance of the cubit to [GetCubit]
  void addInstanceToGetCubit<T extends Cubit>({String? id}) {
    if (runtimeType.toString() != T.toString()) {
      throw ("Please specify the correct type of cubit addInstanceToGetCubit<$runtimeType>");
    }
    GetCubit.put<T>(this as T, id: id);
  }

  /// get all the ids with which the cubit was intialized in [GetCubit]
  List<String> getAllInstanceIds() {
    String k = runtimeType.toString();
    List<String> keys = GetCubit._mp.keys.toList();
    List<String> res = [];
    for (int idx = 0; idx < keys.length; idx++) {
      if (keys[idx].contains(k)) {
        String sanitizedKey = keys[idx].replaceAll(k, '');
        if (sanitizedKey.isEmpty) continue;
        res.add(sanitizedKey);
      }
    }
    return res;
  }
}
