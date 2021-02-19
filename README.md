# ColorTool
This is a nice Swift package that allows users to convert color types to other color types.
Currently ColorTool supports:
* RGB to Hex
    * RBG(String) -> Hex(String)
    * RGB(Red: Int, Green: Int, Blue: Int) -> Hex(String)
    * RGB(RGBColor) -> Hex(String)
* RGB to CMYK
    * RGB(Red: Int, Green: Int, Blue: Int) -> CMYK(String)
* Hex to RGB
    * Hex(String) -> RGB(String)
* Hex to CMYK
    * Hex(String) -> CMYK(String)
* CMYK to RGB
    * CMYK(C: Int, M:Int, Y:Int, K:Int) ->RGB(String)
* CMYK to Hex
    * CMYK(C: Int, M:Int, Y:Int, K:Int) ->Hex(String)

## Using ColorTool
The format to use a func requiring a String is to use a comma with no trailing space as a delimiter.
example:
```swift
ColorTool.RGBToHex(RGBString: "011,024,56")
```

