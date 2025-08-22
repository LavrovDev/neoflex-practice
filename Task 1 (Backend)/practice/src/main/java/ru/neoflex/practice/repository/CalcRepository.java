package ru.neoflex.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.neoflex.practice.model.Operation;

public interface CalcRepository extends JpaRepository<Operation, Long> {

}

