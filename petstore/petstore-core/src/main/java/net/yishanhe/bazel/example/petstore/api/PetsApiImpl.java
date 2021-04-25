package net.yishanhe.bazel.example.petstore.api;

import net.yishanhe.bazel.example.api.petstore.PetsApi;
import net.yishanhe.bazel.example.api.petstore.dto.Pet;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.NativeWebRequest;

import java.util.List;
import java.util.Optional;

@RestController
public class PetsApiImpl implements PetsApi {
    @Override
    public Optional<NativeWebRequest> getRequest() {
        return Optional.empty();
    }

    @Override
    public ResponseEntity<Void> createPets() {
        return null;
    }

    @Override
    public ResponseEntity<List<Pet>> listPets(Integer limit) {
        return null;
    }

    @Override
    public ResponseEntity<List<Pet>> showPetById(String petId) {
        return null;
    }
}
