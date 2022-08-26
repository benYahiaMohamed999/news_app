abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessErrorsState extends NewsState {
  final String error;

  NewsGetBusinessErrorsState(this.error);
}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsErrorsState extends NewsState {
  final String error;

  NewsGetSportsErrorsState(this.error);
}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceErrorsState extends NewsState {
  final String error;

  NewsGetScienceErrorsState(this.error);
}
