package com.adena.edhukanuserservice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@Slf4j
public class EdhukanUserServiceApplication {

    public static void main(String[] args) {
        String profile = System.getenv("PROFILE");
        System.setProperty("spring.profiles.active", profile != null ? profile : "default");
        // Railway's internal interface takes some time to start. We wait for it to be ready.
        log.debug("Waiting fo Internal Interface to start...");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        SpringApplication.run(EdhukanUserServiceApplication.class, args);
    }

}
