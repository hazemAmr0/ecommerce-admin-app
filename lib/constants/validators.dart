class  AppValidators{
  String? validateName(String value, String fieldName){
    if(value.isEmpty){
      return "Please enter $fieldName";
    }
    return null;
  }
}