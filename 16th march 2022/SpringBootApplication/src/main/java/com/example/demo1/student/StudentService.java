package com.example.demo1.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
@Service
public class StudentService {

    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository ) {
        this.studentRepository = studentRepository;
    }
    public List<Student> getStudents() {
        return studentRepository.findAll();
    }
//    public List<Student> getStudents() {
//        return List.of(
//                new Student(
//                        1L,
//                        "Ketan",
//                        "ketan.shinde@sparkeighteen.com",
//                        21,
//                        LocalDate.of(2000, Month.OCTOBER, 6)
//                )
//        );
}
