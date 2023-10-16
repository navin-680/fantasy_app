import 'package:aivoks_fantasy_app/screens/auth/views/login_screen.dart';
import 'package:aivoks_fantasy_app/screens/auth/views/otp_screen.dart';
import 'package:aivoks_fantasy_app/landing_screen.dart';
import 'package:aivoks_fantasy_app/screens/auth/views/widgets/login_butoon_screen.dart';
import 'package:aivoks_fantasy_app/screens/contest/views/winner_leaderboard_page.dart';
import 'package:aivoks_fantasy_app/screens/intro_slider/intro_slider.dart';
import 'package:aivoks_fantasy_app/screens/profile/views/address_page.dart';
import 'package:aivoks_fantasy_app/screens/profile/views/profile_screen.dart';
import 'package:aivoks_fantasy_app/screens/profile/widgets/adhar_input_widget.dart';
import 'package:aivoks_fantasy_app/splash_page.dart';
import 'package:get/get.dart';
import 'screens/contest/views/join_contests_page.dart';
import 'screens/create_team/views/create_team_page.dart';
import 'screens/create_team/views/my_teams_screen.dart';
import 'screens/create_team/views/my_teams_view_page.dart';
import 'screens/create_team/widgets/captain_vice_captain_list_page.dart';
import 'screens/profile/views/edit_profile_page.dart';
import 'screens/profile/widgets/about_widget.dart';
import 'screens/profile/widgets/bank_details_page.dart';
import 'screens/profile/widgets/ekyc_success_failed_page.dart';
import 'screens/profile/widgets/verify_adhar_widget.dart';
import 'screens/profile/widgets/verify_pan_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String landing = '/landing';
  static const String home = '/home';
  static const String otp = '/otp';
  static const String loginButtonScreen = '/loginButtonScreen';
  static const String profile = '/profile';
  static const String addressPage = '/addressPage';
  static const String editProfilePage = '/editProfilePage';
  static const String joinContestsPage = '/joinContestsPage';
  static const String winnerLeaderBoardPage = '/winnerLeaderBoardPage';
  static const String adharInputPage = '/adharInputPage';
  static const String verifyAdharWidget = '/verifyAdharWidget';
  static const String verifyPanPage = '/verifyPanPage';
  static const String eKycSuccessAndFailedPage = '/eKycSuccessAndFailedPage';
  static const String bankDetailsPage = '/bankDetailsPage';
  static const String createTeamPage = '/createTeamPage';
  static const String myTeamsScreen = '/myTeamsScreen';
  static const String myTeamsViewPage = '/myTeamsViewPage';
  static const String aboutProfileWidget = '/aboutProfileWidget';
  static const String captainViceCaptainListPage =
      '/captainViceCaptainListPage';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: intro, page: () => IntroScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: otp, page: () => OtpScreen()),
    GetPage(name: landing, page: () => const LandingScreen()),
    GetPage(name: home, page: () => const LandingScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: addressPage, page: () => const AddressPage()),
    GetPage(name: editProfilePage, page: () => const EditProfilePage()),
    GetPage(name: loginButtonScreen, page: () => const LoginButtonScreen()),
    GetPage(name: joinContestsPage, page: () => const JoinContestsPage()),
    GetPage(name: adharInputPage, page: () => const AdharInputWidget()),
    GetPage(name: verifyAdharWidget, page: () => const VerifyAdharWidget()),
    GetPage(name: verifyPanPage, page: () => const VerifyPanPage()),
    GetPage(name: bankDetailsPage, page: () => const BankDetailsPage()),
    GetPage(name: createTeamPage, page: () => const CreateTeamPage()),
    GetPage(name: myTeamsScreen, page: () => const MyTeamsScreen()),
    GetPage(name: myTeamsViewPage, page: () => const MyTeamsViewPage()),
    GetPage(name: aboutProfileWidget, page: () => const AboutProfileWidget()),
    GetPage(
        name: captainViceCaptainListPage,
        page: () => const CaptainViceCaptainListPage()),
    GetPage(
        name: eKycSuccessAndFailedPage,
        page: () => const EKycSuccessAndFailedPage()),
    GetPage(
        name: winnerLeaderBoardPage, page: () => const WinnerLeaderBoardPage()),
    // Add more routes as needed
  ];
}
