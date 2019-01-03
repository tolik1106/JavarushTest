package com.zhitar.jrtask.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "parts")
@EqualsAndHashCode(exclude = "id")
public class Part {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank(message = "Name is required!")
    private String name;

    @Column(name = "necessary")
    private boolean necessary;

    @Column(name = "quantity")
    @Min(value = 0, message = "Should be positive number!")
    private int quantity;
}
