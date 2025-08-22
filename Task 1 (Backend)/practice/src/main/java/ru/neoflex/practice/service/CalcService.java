package ru.neoflex.practice.service;

import org.springframework.stereotype.Service;
import ru.neoflex.practice.model.Operation;
import ru.neoflex.practice.repository.CalcRepository;

import java.util.List;

@Service
public class CalcService {
    private final CalcRepository calcRepository;

    public CalcService(CalcRepository calcRepository) {
        this.calcRepository = calcRepository;
    }

    public void add(String operation, int a, int b, int result) {
        calcRepository.save(new Operation(operation, a, b, result));
    }

    public List<Operation> list() {
        return calcRepository.findAll();
    }
}
