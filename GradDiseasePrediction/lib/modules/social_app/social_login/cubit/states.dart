

abstract class SocialLoginStates {}
class SocialLoginInitialStates extends SocialLoginStates {}

class SocialLoginLoadingStates extends SocialLoginStates {}
class SocialLoginSuccessStates extends SocialLoginStates {}
class SocialLoginErrorStates extends SocialLoginStates
{
   final String error;
   SocialLoginErrorStates(this.error);
}
class SocialChangePasswordVisibilityStates extends SocialLoginStates{}
