

abstract class SocialRegisterStates {}
class SocialRegisterInitialStates extends SocialRegisterStates {}

class SocialRegisterLoadingStates extends SocialRegisterStates {}
class SocialRegisterSuccessStates extends SocialRegisterStates {}
class SocialRegisterErrorStates extends SocialRegisterStates
{
   final String error;
   SocialRegisterErrorStates(this.error);
}
class SocialCreateUserSuccessStates extends SocialRegisterStates {}
class SocialCreateUserErrorStates extends SocialRegisterStates
{
   final String error;
   SocialCreateUserErrorStates(this.error);
}
class SocialRegisterChangePasswordVisibilityStates extends SocialRegisterStates{}
