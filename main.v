module main

import json2 as json

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
// 	println(json.encode(SumAlias(10)))
// 	println(json.encode(SumAlias('hi')))
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
	
	println(json.encode([{'hi': Basic{a: 1 b: 'a' c: false}, 'bye': Basic{a: 2 b: 'b' c: true}}, {'hi2': Basic{a: 3 b: 'c' c: false}, 'bye2': Basic{a: 4 b: 'd' c: true}}]))
	println(json.encode([{'hi': Basic{a: 1 b: 'a' c: false}, 'bye': Basic{a: 2 b: 'b' c: true}}, {'hi2': Basic{a: 3 b: 'c' c: false}, 'bye2': Basic{a: 4 b: 'd' c: true}}], prettify: true))
}
