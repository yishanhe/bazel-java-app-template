package net.yishanhe.bazel.example.petstore.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name="pets")
public class PetModel {

    @Id
    @GeneratedValue
    private long id;

    private String name;

    private String tag;
}
