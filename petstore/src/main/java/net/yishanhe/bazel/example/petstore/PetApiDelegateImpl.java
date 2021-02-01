package petstore.src.main.java.net.yishanhe.bazel.example.petstore;

import com.example.api.PetsApiDelegate;
import com.example.model.Pet;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.NativeWebRequest;

import java.util.List;
import java.util.Optional;

public class PetApiDelegateImpl implements PetsApiDelegate {

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
