module main

import json2 as json

type StrAlias = string
type BoolAlias = bool
type IntAlias = int
type FloatAlias = f64

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
}
