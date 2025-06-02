library movies_screen;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_onboarding/repository/repository_movies.dart';

import 'package:flutter_onboarding/di/di.dart';
import 'package:url_launcher/url_launcher.dart';

part 'data/movie_ui_mapper.dart';

part 'data/movie_ui_model.dart';

part 'movie_details/movie_details_screen.dart';

part 'movie_details/movie_details_screen_module.dart';

part 'movie_details/bloc/movie_details_bloc.dart';

part 'movie_details/bloc/movie_details_event.dart';

part 'movie_details/bloc/movie_details_interactor.dart';

part 'movie_details/bloc/movie_details_state.dart';

part 'movies_list/movies_list_screen.dart';

part 'movies_list/movies_screen_module.dart';

part 'movies_list/bloc/movies_interactor.dart';

part 'movies_list/bloc/movies_list_bloc.dart';

part 'movies_list/bloc/movies_list_event.dart';

part 'movies_list/bloc/movies_list_state.dart';
