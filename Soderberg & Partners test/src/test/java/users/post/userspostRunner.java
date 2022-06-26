package users.post;

import com.intuit.karate.junit5.Karate;

class userspostRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users-post").relativeTo(getClass());
    }
}
