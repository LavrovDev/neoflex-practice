package ru.neoflex.practice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import ru.neoflex.practice.model.Operation;
import ru.neoflex.practice.service.CalcService;

import java.util.List;

@RestController
public class CalcController {
    private final CalcService calcService;
    private int result;

    public CalcController(CalcService calcService) {
        this.calcService = calcService;
    }

    @GetMapping("/plus/{a}/{b}")
    public int sum(@PathVariable int a, @PathVariable int b) {
        result = a + b;
        calcService.add("Addition", a, b, result);
        return result;
    }

    @GetMapping("/minus/{a}/{b}")
    public int diff(@PathVariable int a, @PathVariable int b) {
        result = a - b;
        calcService.add("Subtraction", a, b, result);
        return result;
    }

    @GetMapping("/operations")
    public List<Operation> getOperation() {
        return calcService.list();
    }
}
