package net.yishanhe.bazel.example.petstore.repository;

import net.yishanhe.bazel.example.petstore.model.PetModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PetRepository extends JpaRepository<PetModel, Long> {
}
