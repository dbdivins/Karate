package users.post;

import com.intuit.karate.junit5.Karate;

class userspostRegisterRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users-post-register").relativeTo(getClass());
    }
}
