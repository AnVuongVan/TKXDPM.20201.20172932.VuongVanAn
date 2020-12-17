import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import sample.controller.PlaceOrderController;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ValidatePhoneNumberTest {

    private PlaceOrderController placeOrderController;

    @BeforeEach
    public void setUp() throws Exception {
        placeOrderController = new PlaceOrderController();
    }

    @ParameterizedTest
    @CsvSource({
            "0123456789, true",
            "01234, false",
            "abc123, false",
            "123456789, false"
    })

    @Test
    public void test(String phone, boolean expected) {
        boolean isValid = placeOrderController.validatePhoneNumber(phone);
        assertEquals(expected, isValid);
    }

}