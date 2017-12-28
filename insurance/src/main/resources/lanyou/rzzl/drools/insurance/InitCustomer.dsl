package lanyou.rzzl.drools.insurance;
declare User
    age : int;
    validFlag : boolean;
end
rule "init studentbean"
salience 1000
    when
        $u:UserInfoBean(userId!=null)
    then
        System.out.println("valid applicant for["+$u.getUserId()+"] and validFlag is["+$u.isValidFlag()+"]");
        User userVO=new User();
        userVO.setAge( $u.getAge());
        userVO.setValidFlag($u.isValidFlag());
        insert(userVO);
end
rule "less than < 17"
    when
       user: User(age<17) && u:UserInfoBean(userId!=null)
    then
       u.setApplicant("0");
end
rule "less than < 45"
    when
       (user: User(age<46 && age>=17)) && u:UserInfoBean(userId!=null)
    then
        System.out.println("set applicant for "+u.getUserId()+" to 7000000");
        u.setApplicant("7000000");
end
rule "less than < 70"
    when
       (user:User(age<70 && age>=46)) && u:UserInfoBean(userId!=null)
    then
        System.out.println("set applicant for "+u.getUserId()+" to 5000000");
        u.setApplicant("5000000");
end

rule "not a valid applicant"
    when
       user:User(!validFlag) && u:UserInfoBean(userId!=null)
    then
       u.setApplicant("0");
end
