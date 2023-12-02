#include <stdint.h>

typedef enum {
    PlusZero = 0x00,
    MinusZero = 0x01,
    PlusInf = 0xF0,
    MinusInf = 0xF1,
    PlusRegular = 0x10,
    MinusRegular = 0x11,
    PlusDenormal = 0x20,
    MinusDenorma = 0x21,
    SignalingNaN = 0x30,
    QuietNaN = 0x31
} float_class_t;

float_class_t classify(double *val_ptr) {
    uint64_t *bit_ptr = (uint64_t*)val_ptr;
    uint64_t bit = *bit_ptr;

    uint64_t sign_bit = bit >> 63;
    uint64_t exp_bit = (bit >> 52) & 0x7FF;
    uint64_t frac_bit = bit & ((1ULL << 52) - 1);

    if (exp_bit == 0 && frac_bit == 0) {
        return sign_bit ? MinusZero : PlusZero;
    } else if (exp_bit == 0 && frac_bit != 0) {
        return sign_bit ? MinusDenorma : PlusDenormal;
    } else if (exp_bit != 0 && exp_bit != 0x7FF) {
        return sign_bit ? MinusRegular : PlusRegular;
    } else if (exp_bit == 0x7FF && frac_bit == 0) {
        return sign_bit ? MinusInf : PlusInf;
    } else if (exp_bit == 0x7FF && (frac_bit & (1ULL << 51))) {
        return QuietNaN;
    } else {
        return SignalingNaN;
    }
}
