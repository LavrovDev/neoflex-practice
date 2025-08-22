package ru.neoflex.practice.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
public class CalcControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testAddition_PositiveNumbers() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/plus/10/5"))
                .andDo(print())
                .andExpect(jsonPath("$").value("15"))
                .andExpect(status().isOk());
    }

    @Test
    public void testAddition_NegativeNumbers() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/plus/-10/-5"))
                .andDo(print())
                .andExpect(jsonPath("$").value("-15"))
                .andExpect(status().isOk());
    }

    @Test
    public void testAddition_MixedNumbers() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/plus/10/-3"))
                .andDo(print())
                .andExpect(jsonPath("$").value("7"))
                .andExpect(status().isOk());
    }

    @Test
    public void testSubtraction_PositiveNumbers() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/minus/20/8"))
                .andDo(print())
                .andExpect(jsonPath("$").value("12"))
                .andExpect(status().isOk());
    }

    @Test
    public void testSubtraction_NegativeResult() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/minus/5/10"))
                .andDo(print())
                .andExpect(jsonPath("$").value("-5"))
                .andExpect(status().isOk());
    }

    @Test
    public void testSubtraction_NegativeNumbers() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/minus/-5/-10"))
                .andDo(print())
                .andExpect(jsonPath("$").value("5"))
                .andExpect(status().isOk());
    }
}
