package users.get;

import com.intuit.karate.junit5.Karate;

class usersgetListUsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users-get-list_users").relativeTo(getClass());
    }
}
