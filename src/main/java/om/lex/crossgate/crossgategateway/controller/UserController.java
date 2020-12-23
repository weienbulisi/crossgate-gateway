package om.lex.crossgate.crossgategateway.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 薇恩
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/list")
    public String getUser(String username){
        return "Hello "+ username;
    }
}
