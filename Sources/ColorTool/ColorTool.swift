import Foundation

public struct ColorTool {
    //MARK: - RGB to X
    public static func getRGBArray(RGBString: String) -> [UInt16]{
        var RGBArray: [UInt16] = []
        if (RGBString.count != 9){
            print(ColorError.RBGFormattingError(Error: "RGBString is not valid"))
            return RGBArray
        }
        var r = ""
        var g = ""
        var b = ""
        for (index, color) in RGBString.enumerated() {
            switch index {
                case 0...2:
                    r += String(color)
                case 3...5:
                    g += String(color)
                case 6...8:
                    b += String(color)
                default:
                    print(ColorError.RBGFormattingError(Error: "RGBString is not formatted correctly"))
            }
        }
        RGBArray.append(UInt16(r)!)
        RGBArray.append(UInt16(g)!)
        RGBArray.append(UInt16(b)!)
        return RGBArray
    }
    public static func RGBToHex(RGBcolor: RGBColor) -> String{
        return RGBToHex(red: RGBcolor.red, green: RGBcolor.green, blue: RGBcolor.blue)
    }
    public static func RGBToHex(RGBString: String) -> String{
        if(RGBString.count != 9){
            //formatting should be 000000000 - 2552552555 and if it is not its formatted incorrectly
            print(ColorError.RBGFormattingError(Error: "RGB String is not formatted correctly. To fix please format string with three values for each color. ie 000000000 to 255255255"))
            return ""
        }
        let rgbArray: [UInt16] = getRGBArray(RGBString: RGBString)
        return RGBToHex(red: rgbArray[0], green: rgbArray[1], blue: rgbArray[2])
    }
   public static func RGBToHex(red: UInt16, green: UInt16, blue: UInt16) -> String {
        var hexValue: String = ""
        
        if(0..<256 ~= red){
            hexValue = String(format:"%02X", red)
        } else {
            print(ColorError.RGBOutOfBoundsError(Error: "red value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= green){
            hexValue += String(format:"%02X", green)
        } else {
           print(ColorError.RGBOutOfBoundsError(Error: "green value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= blue){
            hexValue += String(format:"%02X", blue)
        } else { 
          print(ColorError.RGBOutOfBoundsError(Error: "blue value is not between 0 and 255"))
            return ""
        }
        return hexValue
    }
    
    public static func RGBToCMYK()->String{
        return ""
    }
    
    public static func RGBStringToCMYK()->String{
        return ""
    }
    
    //MARK: - HEX to X
    
    public static func HexToRGBString(hex: String) -> String{
        if (!(6..<11 ~= hex.count)){
            //hex string format is not FFFFFF or #FFFFFF or 0xFFFFFF or #0xFFFFFF
            print(ColorError.HEXFormattingError(Error: "Hex string is not formatted correctly"))
            return ""
        }

        var r = ""
        var g = ""
        var b = ""
        func extractRGB(indexAdjust: Int){
            for (index, color) in hex.enumerated() {
                switch index {
                    case indexAdjust...indexAdjust+1:
                        r += String(color)
                    case indexAdjust+2...indexAdjust+3:
                        g += String(color)
                    case indexAdjust+4...indexAdjust+5:
                        b += String(color)
                default:
                    continue
                }
            }
        }
        if (hex.lowercased().hasPrefix("#0x") || hex.lowercased().hasPrefix("#0b")) && (hex.count == 9){
            extractRGB(indexAdjust: 3)
        }else if (hex.lowercased().hasPrefix("0x") || hex.lowercased().hasPrefix("0b")) && (hex.count == 8){
          extractRGB(indexAdjust: 2)
        }else if (hex.hasPrefix("#") && (hex.count == 7)){
            extractRGB(indexAdjust: 1)
        }else if (hex.count == 6){
           extractRGB(indexAdjust: 0)
        }else{
            print(ColorError.HEXFormattingError(Error: "Hex string is not formatted correctly or is out of bounds. To fix format hex like #0xFFFFFF or #FFFFFF or FFFFFF"))
            return""
        }
        r = String(format:"%03D", Int(r, radix: 16)!)
        g = String(format:"%03D", Int(g, radix: 16)!)
        b = String(format:"%03D", Int(b, radix: 16)!)
        var rgbValue = r
        rgbValue += g
        rgbValue += b
        return rgbValue
    }
    
    public static func HexToCMYK(){
        
    }
    
    
    //MARK: - CMYK to X
    public static func CMYKToRGB(){
        
    }
    public static func CMYKToHex(){
        
    }

    
}
