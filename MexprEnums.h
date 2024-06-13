#ifndef __MEXPR_ENUMS__
#define __MEXPR_ENUMS__

typedef enum mexprepp_dtypes_t {

  MATH_C_INT,
  MATH_C_DOUBLE,
  MATH_C_VARIABLE,
  MATH_C_IPV4,
  MATH_C_DTYPE_MAX,

} mexprepp_dtypes_t;

typedef enum EXTRA_ENUMS {

  PARSER_EOL = (int)MATH_C_DTYPE_MAX + 1,

} EXTRA_ENUMS;

#endif  // !DEBUG
