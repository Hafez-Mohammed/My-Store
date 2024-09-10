class ApiLinks {
  static const String server = "http://192.168.43.83/my_store";
  static const String test = "$server/test.php";
  // ========================== Auth =====================================
  static const String signUp = "$server/auth/sign_up.php";
  static const String login = "$server/auth/login.php";
  static const String codeVerification = "$server/auth/code_verification.php";
  static const String resendVerificationCode =
      "$server/auth/resend_verification_code.php";

  // =======================  Tokens
  static const String addToken = "$server/auth/add_token.php";
  static const String deleteToken = "$server/auth/delete_token.php";

  // ========================== Forget Password =====================================
  static const String checkEmail =
      "$server/auth/forget_password/check_email.php";
  static const String forgetPasswordCodeVerification =
      "$server/auth/forget_password/code_verification.php";
  static const String resetPassword =
      "$server/auth/forget_password/reset_password.php";
  // =======================  image
  static const String categoriesImage = "$server/upload/categories";
  static const String productsImage = "$server/upload/products";
  static const String offersImage = "$server/upload/offers";
  // ========================
  static const String home = "$server/home.php";
  static const String products = "$server/products/view.php";
  static const String productSpecification =
      "$server/products/get_specifications.php";
  static const String getCoupon = "$server/coupon/get_coupon.php";
  // ====================== Favorite
  static const String addFavorite = "$server/favorite/add_favorite.php";
  static const String deleteFavorite = "$server/favorite/delete_favorite.php";
  static const String favorites = "$server/my_favorites/view.php";
  static const String deleteFavoritesId = "$server/my_favorites/delete.php";
  // ====================== Cart
  static const String addCart = "$server/cart/add.php";
  static const String updateCart = "$server/cart/update.php";
  static const String deleteCart = "$server/cart/delete.php";
  static const String cartProducts = "$server/cart/view.php";
  // ====================== Search
  static const String searchAllProducts = "$server/search/search_all.php";
  static const String searchCatProducts = "$server/search/search_cat.php";
  // ====================== Address
  static const String addAddress = "$server/address/add.php";
  static const String updateAddress = "$server/address/update.php";
  static const String deleteAddress = "$server/address/delete.php";
  static const String addresses = "$server/address/view.php";
  // ====================== Order
  static const String checkout = "$server/order/checkout.php";
  static const String orders = "$server/order/view.php";
  static const String deleteOrder = "$server/order/delete.php";
  static const String orderProducts = "$server/order/details_view.php";

  // ====================== Notification
  static const String notifications = "$server/notifications/view.php";
  static const String deleteNotification = "$server/notifications/delete.php";
}
