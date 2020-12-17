import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import sample.controller.PlaceOrderController;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ValidateAddressTest {

    private PlaceOrderController placeOrderController;

    @BeforeEach
    public void setUp() throws Exception {
        placeOrderController = new PlaceOrderController();
    }

    @ParameterizedTest
    @CsvSource({
            "hanoi, true",
            "so 15 Hai Ba Trung Ha Noi, true",
            "$#Hanoi, false",
            "null, false"
    })

    @Test
    void test(String address, boolean expected) {
        boolean isValid = placeOrderController.validateAddress(address);
        assertEquals(expected, isValid);
    }

}