package com.rocket.code.persistence.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TareaModel {
    private Long id;
    private String nombre;
    private String descripcion;
    private LocalDate fecha_inicio;
}
