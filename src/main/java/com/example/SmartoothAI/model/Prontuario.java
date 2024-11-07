package com.example.SmartoothAI.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.Date;

@Data
@Entity
@Table(name = "tb_prontuario")
public class Prontuario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prontuario_seq")
    @SequenceGenerator(name = "prontuario_seq", sequenceName = "seq_prontuario_id", allocationSize = 1)
    @Column(name = "prontuario_id")
    private Long prontuarioId;

    @Column(name = "prescricao", length = 255)
    private String prescricao;

    @Column(name = "observacoes", length = 255)
    private String observacoes;

    @Temporal(TemporalType.DATE)
    @Column(name = "data_registro")
    private Date dataRegistro;
}
