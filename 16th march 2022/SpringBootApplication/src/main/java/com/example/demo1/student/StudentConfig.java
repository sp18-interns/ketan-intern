package com.example.demo1.student;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@Configuration
public class StudentConfig {
    @Bean
    CommandLineRunner commandLineRunner(StudentRepository repository ) {
        return args -> {
            Student ketan = new Student(
						1L,
						"Ketan",
						"ketan.shinde@sparkeighteen.com",
						21,
						LocalDate.of(2000, Month.OCTOBER, 6)
				);
            Student bhavesh = new Student(
                    "bhavesh",
                    "bhavesh.kadam@sparkeighteen.com",
                    21,
                    LocalDate.of(2000, Month.SEPTEMBER, 7)
            );
            repository.saveAll(
                    List.of(ketan, bhavesh)
            );
        };
    }
}
