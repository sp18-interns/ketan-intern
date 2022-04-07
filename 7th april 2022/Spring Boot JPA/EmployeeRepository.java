EmployeeRepository.java

package com.workspace.demoexample;

import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employee, Long> {
}