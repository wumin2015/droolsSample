package lanyou.rzzl.drools.model;
no-loop
declare User
    age : int;
    validFlag : boolean;
end

rule "init studentbean"
salience 1000
    when
        u : UserInfoBean()
    then
        User user=new User();
        //user.setAge(u.getAge());
        user.setAge(u.getUserId());
        System.out.println("valid applicant for["+u.getUserId()+"] and validFlag is["+u.isValidFlag()+"]");
        insert(user);
end

rule "less than < 17"
    when
       u : User ( age <17); 
       facts : UserInfoBean()
    then
       facts.setApplicant("0");
end

rule "less than < 45"
    when
        u : User (age <46 && age >=17); 
       facts : UserInfoBean()
    then
        facts.setApplicant("7000000");
end

rule "less than < 70"
    when
        u : User (age<70 && age>=46); 
        facts : UserInfoBean()
    then
        facts.setApplicant("5000000");
end
