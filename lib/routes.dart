import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/middleware/my_middleware.dart';
import 'package:my_store/view/screen/address/add_address.dart';
import 'package:my_store/view/screen/address/addresses.dart';
import 'package:my_store/view/screen/address/edit_address.dart';
import 'package:my_store/view/screen/auth/forget%20password/code_verification.dart';
import 'package:my_store/view/screen/auth/forget%20password/forget_password.dart';
import 'package:my_store/view/screen/auth/forget%20password/reset_password.dart';
import 'package:my_store/view/screen/auth/forget%20password/success_password_reset.dart';
import 'package:my_store/view/screen/auth/login.dart';
import 'package:my_store/view/screen/auth/sign_up.dart';
import 'package:my_store/view/screen/auth/signup_code_verification.dart';
import 'package:my_store/view/screen/auth/success_sign_up.dart';
import 'package:my_store/view/screen/check_out.dart';
import 'package:my_store/view/screen/choose_language.dart';
import 'package:my_store/view/screen/home_screen.dart';
import 'package:my_store/view/screen/my_favorites.dart';
import 'package:my_store/view/screen/notifications.dart';
import 'package:my_store/view/screen/onboarding.dart';
import 'package:my_store/view/screen/order_details.dart';
import 'package:my_store/view/screen/product_details.dart';
import 'package:my_store/view/screen/products.dart';
import 'package:my_store/view/test_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/test",
    page: () => const TestView(),
  ),
  GetPage(
      name: AppRoutes.chooseLanguage,
      page: () => const ChooseLanguage(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutes.onboarding, page: () => const Onboarding()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.products, page: () => const Products()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.myFavorites, page: () => const MyFavorites()),
  GetPage(name: AppRoutes.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoutes.notifications, page: () => const Notifications()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),


  // Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoutes.codeVerification, page: () => const CodeVerification()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successPasswordReset,
      page: () => const SuccessPasswordReset()),
  GetPage(
      name: AppRoutes.signupCodeVerification,
      page: () => const SignupCodeVerification()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),

  // Address
  GetPage(name: AppRoutes.addresses, page: () => const Addresses()),
  GetPage(name: AppRoutes.addAddress, page: () => const AddAddress()),
  GetPage(name: AppRoutes.editAddress, page: () => const EditAddress()),
];
