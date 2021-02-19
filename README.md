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
    
    ColorTool has built in error management to ensure a user is within the correct bounds. If the parameters are not valid it will print the error to the console.

## Using ColorTool
to make a call to a ColorTool function

 **Standard pass RGB to Hex:**
```swift
ColorTool.RGBToHex(red: 62, green: 62, blue: 62) 
// returns "#3E3E3E"
```
**Pass a RGBColor to Hex:**
```swift
let myColor = RGBColor(red: 14, green: 14, blue: 14)
ColorTool.RGBToHex(RGBcolor: myColor) 
// returns "#0E0E0E"
```
**Pass a RGB String with commas with no trailing spaces as a delimiter:**
```swift
ColorTool.RGBToHex(RGBString: "11,24,156")
// returns "#0B1838"
```

To get access to RGB String or CMYK String as an array just call the toRGBArray() or toCMYKArray() method. *Both functions will take a string with the a comma delimeter*
 Example:
 **to RGB array**
```swift
ColorTool.ToRGBArray("255,255,255") 
// returns [255, 255, 255]
//where the output is RGBarray[0] = Red, RGBarray[1] = Green. and RGBarray[2] = Blue
```
or if you need to do a conversion first before passing a string.
```swift
ColorTool.toRGBArray(RGBString: ColorTool.CMYKToRGB(C: 0, M: 68, Y: 76, K: 47))
// returns [135, 43, 32]
// where the output is RGBarray[0] = Red, RGBarray[1] = Green. and RGBarray[2] = Blue
```
**to CMYK array**
```swift
ColorTool.toCMYKArray(CMYKString: ColorTool.HexToCMYK(Hex: "#FFFFFF"))
// returns [0, 0, 0, 0]
// whree the output is CMYKarray[0] = Cyan, CMYKarray[1] = Magenta, CMYKarray[2] = Yellow, and CMYKarray[3] = Black
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

