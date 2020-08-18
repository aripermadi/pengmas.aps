part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!(prevPageEvent is GoToSplashPage)) {
      prevPageEvent = GoToSplashPage();
      context.bloc<PageBloc>().add(prevPageEvent);
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        prevPageEvent = GoToLoginPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? OnboardingScreen()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnDetailMateriPage)
                    ? DetailMateriPage()
                    : (pageState is OnTaskPage)
                        ? TaskPage()
                        : (pageState is OnByDoingPage)
                            ? ByDoing()
                            : (pageState is OnRateEmojiPage)
                                ? RateEmoji()
                                : (pageState is OnNoteHomePage)
                                    ? NoteHomePage()
                                    : (pageState is OnGoalsPage)
                                        ? GoalsPage()
                                        : (pageState is OnSuccessPage)
                                            ? SuccessPage()
                                            : (pageState is OnQuestAnswerPage)
                                                ? QuestAnswerPage()
                                                : UserProfile());
  }
}
