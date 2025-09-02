module main

import json2 as json
import time
import math.big

type StrAlias = string
type BoolAlias = bool
type IntAlias = int
type FloatAlias = f64

enum TestEnum {
	a
	b
	c = 10
}

type EnumAlias = TestEnum

type Sum = int | string
type SumAlias = Sum

struct Basic {
	a int
	b string
	c bool
}

type BasicAlias = Basic

struct Opt {
	a ?int
}

type OptAlias = Opt

struct CustomString {
	data string
}

pub fn (cs CustomString) to_json() string {
	return '"<<<' + cs.data + '>>>"'
}

type CustomStringAlias = CustomString

struct Null {
	is_null bool = true
}

pub fn (n Null) to_json() string {
	return 'null'
}

type CustomTime = time.Time

pub fn (ct CustomTime) to_json() string {
	return ct.format_rfc3339()
}

type CustomBig = big.Integer

pub fn (cb CustomBig) to_json() string {
	return cb.str()
}

struct NamedFields {
	a    int    @[json: 'id']
	name string @[json: 'Name']
}

type NamedFieldsAlias = NamedFields

struct SkipFields {
	a    int    @[json: '-']
	name string @[skip]
}

type SkipFieldsAlias = SkipFields

struct SkipSomeFields {
	a    int    @[json: '-']
	name string @[skip]
	hi   bool = true
}

type SkipSomeFieldsAlias = SkipSomeFields

struct PointerFields {
	next &PointerFields = unsafe { nil }
	data int
}

type PointerFieldsAlias = PointerFields

struct OmitFields {
	a ?bool  @[omitempty]
	b string @[omitempty]
	c int    @[omitempty]
	d f64    @[omitempty]
}

type OmitFieldsAlias = OmitFields

fn main() {
	println(json.encode('hello'))
	println(json.encode(StrAlias('hello')))
	println(json.encode(true))
	println(json.encode(BoolAlias(false)))
	println(json.encode(-12345))
	println(json.encode(IntAlias(-12345)))
	println(json.encode(123.323))
	println(json.encode(FloatAlias(123.323)))
	println(json.encode([1, 2, 3, 4]))
	println(json.encode({
		'hi':  0
		'bye': 1
	}))
	println(json.encode(TestEnum.c))
	println(json.encode(EnumAlias(TestEnum.c)))
	println(json.encode(TestEnum.c, enum_as_int: true))
	println(json.encode(EnumAlias(TestEnum.c), enum_as_int: true))
	println(json.encode(Sum(10)))
	println(json.encode(Sum('hi')))
	println(json.encode(SumAlias(10)))
	println(json.encode(SumAlias('hi')))
	println(json.encode(Basic{
		a: 10
		b: 'hi'
		c: true
	}))
	println(json.encode(BasicAlias{
		a: 10
		b: 'hi'
		c: true
	}))

	println(json.encode([
		{
			'hi':  Basic{ a: 1, b: 'a', c: false }
			'bye': Basic{
				a: 2
				b: 'b'
				c: true
			}
		},
		{
			'hi2':  Basic{
				a: 3
				b: 'c'
				c: false
			}
			'bye2': Basic{
				a: 4
				b: 'd'
				c: true
			}
		},
	]))
	println(json.encode([
		{
			'hi':  Basic{ a: 1, b: 'a', c: false }
			'bye': Basic{
				a: 2
				b: 'b'
				c: true
			}
		},
		{
			'hi2':  Basic{
				a: 3
				b: 'c'
				c: false
			}
			'bye2': Basic{
				a: 4
				b: 'd'
				c: true
			}
		},
	],
		prettify: true
	))

	println(json.encode('normal escapes: ", \\ special control escapes: \b, \n, \f, \t, \r, other control escapes: \0, \e'))
	println(json.encode('ascii, é, 한, 😀, ascii'))
	println(json.encode('ascii, é, 한, 😀, ascii', escape_unicode: true))

	println(json.encode(Opt{none}))
	println(json.encode(Opt{99}))

	println(json.encode(OptAlias{none}))
	println(json.encode(OptAlias{99}))

	println(json.encode(CustomString{'hi'}))
	println(json.encode(CustomStringAlias{'hi'}))

	println(json.encode(Null{}))
	println(json.encode(CustomTime(time.now())))
	println(json.encode(CustomBig(big.integer_from_i64(1234567890))))

	println(json.encode(NamedFields{ a: 1, name: 'john' }))
	println(json.encode(NamedFieldsAlias{ a: 1, name: 'john' }))

	println(json.encode(SkipFields{ a: 1, name: 'john' }))
	println(json.encode(SkipFieldsAlias{ a: 1, name: 'john' }))
	println(json.encode(SkipFields{ a: 1, name: 'john' },
		prettify: true
	))

	println(json.encode(SkipSomeFields{ a: 1, name: 'john' }))
	println(json.encode(SkipSomeFieldsAlias{ a: 1, name: 'john' }))
	println(json.encode(SkipSomeFields{ a: 1, name: 'john' },
		prettify: true
	))

	println(json.encode(PointerFields{
		next: &PointerFields{
			next: &PointerFields{
				next: &PointerFields{
					data: 4
				}
				data: 3
			}
			data: 2
		}
		data: 1
	}))
	println(json.encode(PointerFieldsAlias{
		next: &PointerFieldsAlias{
			next: &PointerFieldsAlias{
				next: &PointerFieldsAlias{
					data: 4
				}
				data: 3
			}
			data: 2
		}
		data: 1
	}))
	println(json.encode(PointerFields{
		next: &PointerFields{
			next: &PointerFields{
				next: &PointerFields{
					data: 4
				}
				data: 3
			}
			data: 2
		}
		data: 1
	},
		prettify: true
	))
	
	println(json.encode(OmitFields{}))
	println(json.encode(OmitFieldsAlias{}))
	// 	println(json.encode(&Basic{
	// 		a: 10
	// 		b: 'hi'
	// 		c: true
	// 	}))
}
