DemoExampleApplication.java

package com.workspace.demoexample;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DemoExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoExampleApplication.class, args);
	}

	@Bean
	public CommandLineRunner run(EmployeeRepository repository) {
		return args -> {
			insertJvaAdvocate(repository);
			System.out.println(repository.findAll());
		};
	}
	private void insertJvaAdvocate(EmployeeRepository repository) {
		repository.save(new Employee("Ketan", "Shinde"));
		repository.save(new Employee("Hrishikesh", "Shedge"));
		repository.save(new Employee("Bhavesh", "Kadam"));
		repository.save(new Employee("Vishal", "Zambare"));
	}