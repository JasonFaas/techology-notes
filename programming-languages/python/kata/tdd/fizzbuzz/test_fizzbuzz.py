from fizzbuzz import fizzbuzz


class TestFizzBuzz:
    def test_returns_1_for_input_1(self):
        assert fizzbuzz(1) == "1"

    def test_returns_2_for_input_2(self):
        assert fizzbuzz(2) == "2"

    def test_returns_f_for_input_3(self):
        assert fizzbuzz(3) == "f"

    def test_returns_b_for_input_5(self):
        assert fizzbuzz(5) == "b"

    def test_returns_f_for_input_6(self):
        assert fizzbuzz(6) == "f"

    def test_returns_fb_for_input_15(self):
        assert fizzbuzz(15) == "fb"


