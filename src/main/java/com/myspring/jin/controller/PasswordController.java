package com.myspring.jin.controller;

import com.myspring.jin.domain.UserDto;
import com.myspring.jin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.URLEncoder;

@Controller
@RequestMapping("/password")
public class PasswordController {
    @Autowired
    UserService userService;

    @GetMapping("/look")
    public String look(){
        return "password";
    }


    @PostMapping("/look")
    public String lookFor(String id, String email){

        try {
            String pwd = userService.look(id, email);

            if(pwd==null){
                String msg = URLEncoder.encode("id또는 email이 일치하지 않습니다.", "UTF-8");
                return "redirect:/password/look?msg="+msg;
            }

            String msg = URLEncoder.encode("비밀번호는 '"+pwd+"' 입니다.","UTF-8");
            return "redirect:/password/look?msg="+msg;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "password";
    }
}
