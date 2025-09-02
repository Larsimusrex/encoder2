# encoder2

Experimental json encoder entirely written in V. 

- [x] primitive types
- [ ] pointers (see https://github.com/vlang/v/issues/25208)
- [x] arrays & maps
- [x] enums
- [x] sumtypes
- [x] structs
	- [x] fields
	- [x] option fields
	- [x] pointer fields (see above)
	- [ ] embedded fields (no comptime check)
- [ ] options (not supported by generics)
- [ ] arrays/maps of options (see https://github.com/vlang/v/issues/24466)
- [x] custom encoders
	- [x] interface
	- [x] Null
	- [x] time.Time
	- [x] math.big.Integer
- [ ] aliases
	- [x] primitive types
	- [ ] pointers (see above)
	- [x] arrays & maps
	- [x] enums
	- [x] sumtypes
	- [x] structs
	- [ ] options (see above)
	- [ ] arrays/maps of options (see above)
	- [x] custom encoders
- [x] prettify
- [ ] attributes
	- [x] json: name
	- [x] json: - / skip
	- [x] omitempty
- [x] string escapes
	- [x] control characters
	- [x] unicode
	- [x] surroagte pairs
