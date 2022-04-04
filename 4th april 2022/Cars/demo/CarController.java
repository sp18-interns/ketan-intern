package com.car.demo;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@RestController
public class CarController {
    private Set<Car> cars = new HashSet<>();
    @GetMapping("/v1/cars")
    public ResponseEntity<Set<Car>> getAllCars() {
        return new ResponseEntity<>(cars, HttpStatus.OK);
    }

    @PutMapping("/v1/cars/{carId}")
    public ResponseEntity assignCar(
            @RequestBody CreateCarRequest car,
            @PathVariable int carId
    ){
        this.cars.add(
                new Car()
        );
        return new ResponseEntity(HttpStatus.ACCEPTED);
    }
}
