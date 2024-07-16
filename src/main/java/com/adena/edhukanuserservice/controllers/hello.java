package com.adena.edhukanuserservice.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/hello")
public class hello {
    @GetMapping
    public String hello(){
        return"hello vishnu vardhan reddy";
    }
}
