import 'package:get/get.dart';

/*class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // General
          'app_name': 'Safari Sooq',
          'welcome_text':
              'Welcome to Safari Sooq Store\nRegister now to join smart shopping',
          'new_account': 'Create New Account',
          'start_journey': 'Start your journey with Safari Sooq',
           "info_data": "Personal Data",
          "contact_info": "Contact Data",
          "security_info": "Secure Your Account",
           "additional_data": "Additional Data",
          "email": "Email",
          "username": "Username",
          "first_name": "First Name",
          "last_name": "Last Name",
          "mobile_phone": "Mobile Phone",
          "password": "Password",
          "confirm_password": "Confirm Password",
          "gender": "Gender",
          "select_gender": "Select Your Gender",
          "gender_male": "Male",
          "gender_female": "Female",
          "birthdate": "Birthdate",
          "country": "Country",
           "select_birthdate": "Select Your Birthday",
          'remember_me': 'Remember me',
          'forgot_password': 'Forgot Password',
          'dont_have_account_1': 'Dont have an account?',
          'dont_have_account_2': 'Create New Account',
          'signup': 'Sign Up',
          'login': 'Login',
          'guest': 'Enter as Guest',
          'next': 'Next',
          
          //==================FORGET PASSWORD===================
          'forget_password': 'Forget Password',
          'forget_password_helper':
              'Enter your phone number to reset your password.',
          'email_or_username': 'Email or Username',
          'submit': 'Send code to phone number',
          "sending_code": "Sending Code...",
          'back_to_login': 'Go Back To Login Page',
          //=====================OTP PAGE=====================
          "verify_code": "Verify Code",
          "verify_code_helper": "Enter the 6-digit code which was sent to your phone number",
          "verify": "Verify",
          "verify_processing": "Code Verifying...",
          "resend_code": "Resend Code",
          "resend_in": "Resend in @seconds s",
          //====================RESET PASSWORD=================
          "reset_password": "Reset Password",
          "reset_password_description": "Create your new password to use it on the login page",
          "new_password": "Enter new password",
          "create_password": "Create Password",
          "fill_all_fields": "Please fill all fields",
          "passwords_not_match": "Passwords do not match",
          "password_reset_success": "Password reset successfully",
          "password_rule_length": "At least 8 characters",
          "password_rule_upper": "Contains an uppercase letter",
          "password_rule_number": "Contains a number",
          "password_rule_special": "Contains a special character",
          //==============ERROR MESSAGES===========================
          "username_required": "Username is required",
          "username_max_50": "Username must be at most 50 characters",
          "first_name_required": "First name is required",
          "first_name_min_3": "First name must be at least 3 characters",
          "first_name_max_32": "First name must be at most 32 characters",
          "last_name_required": "Last name is required",
          "last_name_min_3": "Last name must be at least 3 characters",
          "last_name_max_32": "Last name must be at most 32 characters",
          "email_required": "Email is required",
          "email_invalid": "Email must contain @ and gmail.com",
          "mobile_required": "Mobile phone is required",
          "mobile_start_plus": "Mobile phone must start with +",
          "password_required": "Password is required",
          "password_min_8": "Password must be at least 8 characters",
          "password_uppercase": "Password must contain an uppercase letter",
          "password_number": "Password must contain a number",
          "password_special": "Password must contain a special character",
          "confirm_password_required": "Confirm password is required",
          "gender_required": "Gender is required",
          "gender_invalid": "Gender must be 0 or 1",
          "country_required": "Country is required",
          "country_invalid": "Country must be 0 or 1",
          "error": "Error",
          "check_fields": "Please check the fields",



          // Onboarding Features
          'feature1_desc':
              'Enjoy exclusive discounts and deals on various products and services.',
          'feature2_desc':
              'A safe and reliable shopping experience with your data protected.',
          'feature3_desc':
              'Find what you need quickly and easily, all in one place.',
        },
        
        
        
        'ar': {
          // General
          'app_name':  'Safari Sooq',
          'welcome_text':
              'مرحباً بك في متجر سفاري سوق\nسجل الآن للانضمام لعالم التسوق الذكي',
          'new_account': 'إنشاء حساب جديد',
          'start_journey': 'ابدأ رحلتك مع سفاري سوق',
          "info_data": "البيانات الشخصية",
          "contact_info": "بيانات الاتصال",
          "security_info": "تأمين الحساب",
          "additional_data": "بيانات إضافية",
          "email": "البريد الإلكتروني",
          "username": "اسم المستخدم",
          "first_name": "الاسم الأول",
          "last_name": "اسم العائلة",
          "mobile_phone": "رقم الهاتف المحمول",
          "password": "كلمة المرور",
          "confirm_password": "تأكيد كلمة المرور",
          "gender": "الجنس",
          "select_gender": "اختر الجنس",
          "gender_male": "ذكر",
          "gender_female": "أنثى",
          "birthdate": "تاريخ الميلاد",
          "country": "البلد",
          "select_birthdate": "اختر مواليدك",
          'remember_me': 'تذكرني',
          'forgot_password': 'نسيت كلمة المرور',
           'dont_have_account_1': 'ليس لديك حساب؟',
          'dont_have_account_2': 'إنشاء حساب جديد',
          'signup': 'إنشاء حساب',
          'login': 'تسجيل دخول',
           'guest': 'الدخول كضيف',
            'next': 'التالي',
            //==================FORGET PASSWORD===================

          'forget_password': 'نسيت كلمة المرور',
          'forget_password_helper':
              'أدخل رقم الهاتف لإعادة تعيين كلمة المرور.',
          'email_or_username': 'البريد الإلكتروني أو اسم المستخدم',
          'submit': 'إرسال رمز التحقق إلى الهاتف',
          "sending_code": "جارٍ إرسال الرمز...",
          'back_to_login': 'العودة إلى تسجيل الدخول',
          
          //===================OTP PAGE
        "verify_code": "تأكيد الرمز",
        "verify_code_helper": "أدخل الرمز المكون من 6 أرقام المرسل إلى رقم الهاتف الخاص بك",
        "verify": "تأكيد",
         "verify_processing": "يتم التحقق من الكود...",

          "resend_code": "إعادة إرسال الرمز",
          "resend_in": "أعد الإرسال خلال @seconds ثانية",
          //========================RESET PASSWORD===============
            "reset_password": "إعادة تعيين كلمة المرور",
          "reset_password_description": "قم بإنشاء كلمة مرور جديدة لاستخدامها عند تسجيل الدخول",
          "new_password": "أدخل كلمة المرور الجديدة",
          "create_password": "إنشاء كلمة المرور",
          "fill_all_fields": "يرجى ملء جميع الحقول",
          "passwords_not_match": "كلمتا المرور غير متطابقتين",
          "password_reset_success": "تم إعادة تعيين كلمة المرور بنجاح",

          "password_invalid": "كلمة المرور لا تلبي جميع المتطلبات",
          "password_rule_length": "8 أحرف على الأقل",
          "password_rule_upper": "تحتوي على حرف كبير",
          "password_rule_number": "تحتوي على رقم",
          "password_rule_special": "تحتوي على رمز خاص",
          //==pass checker



           //=============ERROR MESSAGES==============
              "username_required": "اسم المستخدم مطلوب",
          "username_max_50": "يجب ألا يزيد اسم المستخدم عن 50 حرفًا",
          "first_name_required": "الاسم الأول مطلوب",
          "first_name_min_3": "يجب أن يكون الاسم الأول 3 أحرف على الأقل",
          "first_name_max_32": "يجب ألا يزيد الاسم الأول عن 32 حرفًا",
          "last_name_required": "اسم العائلة مطلوب",
          "last_name_min_3": "يجب أن يكون اسم العائلة 3 أحرف على الأقل",
          "last_name_max_32": "يجب ألا يزيد اسم العائلة عن 32 حرفًا",
          "email_required": "البريد الإلكتروني مطلوب",
          "email_invalid": "يجب أن يحتوي البريد الإلكتروني على @ و gmail.com",
          "mobile_required": "رقم الجوال مطلوب",
          "mobile_start_plus": "يجب أن يبدأ رقم الجوال بـ +",
          "password_required": "كلمة المرور مطلوبة",
          "password_min_8": "يجب أن تكون كلمة المرور 8 أحرف على الأقل",
          "password_uppercase": "يجب أن تحتوي كلمة المرور على حرف كبير",
          "password_number": "يجب أن تحتوي كلمة المرور على رقم",
          "password_special": "يجب أن تحتوي كلمة المرور على رمز خاص",
          "confirm_password_required": "تأكيد كلمة المرور مطلوب",
          "gender_required": "الجنس مطلوب",
          "gender_invalid": "يجب أن يكون الجنس 0 أو 1",
          "country_required": "الدولة مطلوبة",
          "country_invalid": "يجب أن تكون الدولة 0 أو 1",
          "error": "خطأ",
          "check_fields": "يرجى التحقق من الحقول",

          // Onboarding Features
          'feature1_desc':
              'استمتع بخصومات وعروض حصرية على مختلف المنتجات والخدمات.',
          'feature2_desc':
              'تجربة تسوق آمنة وموثوقة مع ضمان حماية بياناتك.',
          'feature3_desc': 'ابحث عن ما تريده بسرعة وسهولة في مكان واحد.',
        }
     
     
      };
}*/

