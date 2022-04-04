package com.car.demo;

import java.util.Objects;

public class CreateCarRequest {
    private String make;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CreateCarRequest that = (CreateCarRequest) o;
        return Objects.equals(make, that.make);
    }

    @Override
    public int hashCode() {
        return Objects.hash(make);
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }
}
