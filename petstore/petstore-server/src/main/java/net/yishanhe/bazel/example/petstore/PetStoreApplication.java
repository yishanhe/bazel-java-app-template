package net.yishanhe.bazel.example.petstore;

import net.yishanhe.bazel.example.petstore.repository.PetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("net.yishanhe.bazel.example.petstore.repository")
@ComponentScan(basePackages = {"net.yishanhe.bazel.example.petstore"})
public class PetStoreApplication {

    @Autowired
    PetRepository petRepository;

    public static void main(String[] args) {
        SpringApplication.run(PetStoreApplication.class, args);
    }
}
