import 'package:app/core/constant/routes.dart';
import 'package:app/core/middleware/mymiddleware.dart';
import 'package:app/view/screens/address/add.dart';
import 'package:app/view/screens/address/view.dart';
import 'package:app/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:app/view/screens/auth/langauge.dart';
import 'package:app/view/screens/auth/login.dart';
import 'package:app/view/screens/auth/onboarding.dart';
import 'package:app/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:app/view/screens/auth/signup.dart';
import 'package:app/view/screens/auth/forgetpassword/succeful_resetpassword.dart';
import 'package:app/view/screens/auth/forgetpassword/verifycode.dart';
import 'package:app/view/screens/auth/successignup.dart';
import 'package:app/view/screens/auth/verifycode_signup.dart';
import 'package:app/view/screens/cart/cart.dart';
import 'package:app/view/screens/checkout.dart';
import 'package:app/view/screens/home.dart';
import 'package:app/view/screens/homescreen.dart';
import 'package:app/view/screens/items/items.dart';
import 'package:app/view/screens/items/itemsdetail.dart';
import 'package:app/view/screens/items/favitempage.dart';
import 'package:app/view/screens/orders/archive.dart';
import 'package:app/view/screens/orders/details.dart';
import 'package:app/view/screens/orders/pending.dart';
import 'package:app/view/screens/setting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.succefulresetpassword,
      page: () => const SuccefulResetPassword()),
  GetPage(name: AppRoute.successignup, page: () => const SuccesSignUp()),
  GetPage(
      name: AppRoute.verifysocesignup, page: () => const VerifyCodeSignUp()),
  //
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  GetPage(name: AppRoute.favpage, page: () => const FavPage()),
  GetPage(name: AppRoute.addressView, page: () => const AddreesView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
    GetPage(name: AppRoute.chekcout, page: () =>  const CheckOut()),
     GetPage(name: AppRoute.setting, page: () =>  const Setting()),
      GetPage(name: AppRoute.ordersPending, page: () =>  const Pending()),
            GetPage(name: AppRoute.ordersDetails, page: () =>  const OrdersDetails()),
            GetPage(name: AppRoute.orderarchive, page: () =>  const Archive()),





];

// Map<String, Widget Function(BuildContext)>  = {
//   AppRoute.login: (context) => const Login(),
//   AppRoute.onboarding: (context) => const OnBoarding(),
//   AppRoute.signup: (context) => const SignUp(),
//   AppRoute.forgetpassword: (context) => const ForgetPassword(),
//   AppRoute.verifycode: (context) => const VerifyCode(),
//   AppRoute.resetpassword: (context) => const ResetPassword(),
//   AppRoute.succefulresetpassword: (context) => const SuccefulResetPassword(),
//   AppRoute.successignup: (contest) => const SuccesSignUp(),
//   AppRoute.verifysocesignup: (context) => const VerifyCodeSignUp()
// };
