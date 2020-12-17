import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import sample.controller.PlaceOrderController;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ValidateNameTest {

    private PlaceOrderController placeOrderController;

    @BeforeEach
    public void setUp() throws Exception {
        placeOrderController = new PlaceOrderController();
    }

    @ParameterizedTest
    @CsvSource({
            "vuongav, true",
            "an01234, false",
            "$#vuong, false",
            "null, false"
    })

    @Test
    void test(String name, boolean expected) {
        boolean isValid = placeOrderController.validateName(name);
        assertEquals(expected, isValid);
    }

}