# ColorTool
This is a nice Swift package that allows users to convert color types to other color types.
Currently ColorTool supports:*More options coming soon and features*
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
    
    ColorTool has built in error management to ensure a user is within the correct bounds and if not it will print an error.

## Using ColorTool
The format to use a func requiring a String is to use a comma with no trailing space as a delimiter.
 Example:
```swift
ColorTool.RGBToHex(RGBString: "11,24,156")
```
To get access to RGB String or CMYK String as an array just call the toRGBArray() or toCMYKArray method.
 Example:
```swift
ColorTool.toRGBArray(RGBString: ColorTool.CMYKToRGB(C: 0, M: 68, Y: 76, K: 47))
//output is RGBarray[0] = Red, RGBarray[1] = Green. and RGBarray[2] = Blue
```
or to get a CMYK array
```swift
ColorTool.toCMYKArray(CMYKString: ColorTool.HexToCMYK(Hex: "#FFFFFF"))
//output is CMYKarray[0] = Cyan, CMYKarray[1] = Magenta, CMYKarray[2] = Yellow, and CMYKarray[3] = Black
```
## Installing ColorTool
It's easier to install the ColorTool package to your XCode project than baking an apple pie. *Seriously*
1. While you are in your current XCode project open the project navigator.
2. Select the workspace name/app name
3. Under PROJECT
    1. Select (your app name)
    2. Select Swift Packages
    3. Select the add (+) icon
    4. On the search bar paste the link to this [ColorTool](https://github.com/JerShipman/ColorTool.git)
    5. Select branch and main
    6. Select Finish
4. Now place **import ColorTool** into the swift file you are needing to use ColorTool in.

