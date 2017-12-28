declare User
    age : int;
    validFlag : boolean;
end

rule "init studentbean"
salience 1000
    when
        $u:UserInfoBean(userId!=null)
        //$u:UserInfoBean();
    then
      System.out.println("valid applicant for["+$u.getUserId()+"] and validFlag is["+$u.isValidFlag()+"]");
      User userVO=new User();
      userVO.setAge($u.getAge());
      userVO.setValidFlag($u.isValidFlag());
      insert(userVO);
      
End