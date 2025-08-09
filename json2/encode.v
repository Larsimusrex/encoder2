module json2

@[params]
pub struct EncoderOptions {
	prettify      bool
	indent_string string = '    '

	enum_as_int bool
}

struct Encoder {
	EncoderOptions
mut:
	output []u8 = []u8{cap: 2048}
}

@[inline]
fn workaround_cast[T](val voidptr) T {
	return *(&T(val))
}

pub fn encode[T](val T, config EncoderOptions) string {
	mut encoder := Encoder{
		EncoderOptions: config
	}

	encoder.encode_value(val)

	return encoder.output.bytestr()
}

fn (mut encoder Encoder) encode_value[T](val T) {
	$if T.unaliased_typ is string {
		encoder.encode_string(workaround_cast[string](&val))
	} $else $if T.unaliased_typ is bool {
		encoder.encode_boolean(workaround_cast[bool](&val))
	} $else $if T.unaliased_typ is u8 {
		encoder.encode_integer(workaround_cast[u8](&val))
	} $else $if T.unaliased_typ is u16 {
		encoder.encode_integer(workaround_cast[u16](&val))
	} $else $if T.unaliased_typ is u32 {
		encoder.encode_integer(workaround_cast[u32](&val))
	} $else $if T.unaliased_typ is u64 {
		encoder.encode_integer(workaround_cast[u64](&val))
	} $else $if T.unaliased_typ is i8 {
		encoder.encode_integer(workaround_cast[i8](&val))
	} $else $if T.unaliased_typ is i16 {
		encoder.encode_integer(workaround_cast[i16](&val))
	} $else $if T.unaliased_typ is int {
		encoder.encode_integer(workaround_cast[int](&val))
	} $else $if T.unaliased_typ is i64 {
		encoder.encode_integer(workaround_cast[i64](&val))
	} $else $if T.unaliased_typ is usize {
		encoder.encode_integer(workaround_cast[usize](&val))
	} $else $if T.unaliased_typ is isize {
		encoder.encode_integer(workaround_cast[isize](&val))
	} $else $if T.unaliased_typ is f32 {
		encoder.encode_integer(workaround_cast[f32](&val))
	} $else $if T.unaliased_typ is f64 {
		encoder.encode_integer(workaround_cast[f64](&val))
	} $else $if T.unaliased_typ is $array {
		encoder.encode_array(val)
	} $else $if T.unaliased_typ is $map {
		encoder.encode_map(val)
	}
}

fn (mut encoder Encoder) encode_string(val string) {
	encoder.output << `"`
	unsafe { encoder.output.push_many(val.str, val.len) }
	encoder.output << `"`
}

fn (mut encoder Encoder) encode_boolean(val bool) {
	if val {
		unsafe { encoder.output.push_many(true_string.str, true_string.len) }
	} else {
		unsafe { encoder.output.push_many(false_string.str, false_string.len) }
	}
}

fn (mut encoder Encoder) encode_integer[T](val T) {
	integer_val := val.str()
	unsafe { encoder.output.push_many(integer_val.str, integer_val.len) }
}

fn (mut encoder Encoder) encode_null() {
	unsafe { encoder.output.push_many(null_string.str, null_string.len) }
}

fn (mut encoder Encoder) encode_array[T](val []T) {
	encoder.output << `[`
	for i, item in val {
		if i > 0 {
			encoder.output << `,`
		}
		encoder.encode_value(item)
	}
	encoder.output << `]`
}

fn (mut encoder Encoder) encode_map[T](val map[string]T) {
	encoder.output << `{`
	mut first := true
	for key, value in val {
		if first {
			first = false
		} else {
			encoder.output << `,`
		}
		encoder.encode_string(key)
		encoder.output << `:`
		encoder.encode_value(value)
	}
	encoder.output << `}`
}
