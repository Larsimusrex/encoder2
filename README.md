# encoder2

Experimental json encoder entirely written in V. 

- [x] primitive types
- [x] arrays & maps
- [x] enums
- [x] sumtypes
- [x] structs
	- [x] fields
	- [x] option fields
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
	- [ ] omitempty
- [x] string escapes
	- [x] control characters
	- [x] unicode
	- [x] surroagte pairs
