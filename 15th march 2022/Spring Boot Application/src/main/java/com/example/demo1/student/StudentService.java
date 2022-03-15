package com.example.demo1.student;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
@Service
public class StudentService {
    public List<Student> getStudents() {
        return List.of(
                new Student(
                        1L,
                        "Ketan",
                        "ketan.shinde@sparkeighteen.com",
                        21,
                        LocalDate.of(2000, Month.OCTOBER, 6)
                )
        );
    }
}
