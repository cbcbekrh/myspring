package com.myspring.jin.controller;

import com.myspring.jin.domain.UserDto;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        UserDto userDto = (UserDto)target;

        String id = userDto.getId();
        String pwd = userDto.getPwd();

        if(id==null || "".equals(id.trim())) {
            errors.rejectValue("id", "required");
        }else if(id==null || id.length() <  4 || id.length() > 12) {
            errors.rejectValue("id", "invalidLength", new String[]{"4","12"}, null);
        }else if(pwd==null || "".equals(pwd.trim())) {
            errors.rejectValue("pwd", "required");
        }else if(pwd==null || pwd.length() <  4 || pwd.length() > 12) {
            errors.rejectValue("pwd", "invalidLength", new String[]{"4","12"}, null);
        }
    }
}
