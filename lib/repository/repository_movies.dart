library repository_movies;

import 'package:floor/floor.dart';
import 'package:floor_generator/misc/extension/iterable_extension.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_onboarding/network/network.dart';

part 'mapper/mapper.dart';

part 'data/movie_local_model.dart';

part 'storage/movie_dao.dart';

part 'storage/movie_dao_model.dart';

part 'storage/movies_storage.dart';

part 'movies_repository_impl.dart';

part 'movies_repository.dart';

part 'repository_module.dart';
