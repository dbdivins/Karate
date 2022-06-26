package users.get;

import com.intuit.karate.junit5.Karate;

class usersgetSingleUserRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users-get-single_user").relativeTo(getClass());
    }
}
