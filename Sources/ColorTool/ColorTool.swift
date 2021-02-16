import Foundation

public struct ColorTool {
    public static func RGBToHex(RGB: String) -> String{
        if(RGB.count != 9){
            //formatting should be 000000000 - 2552552555 and if it is not its formatted incorrectly
            print(ColorError.RBGFormattingError(Error: "RGB String is not formatted correctly. To fix please format string with three values for each color. ie 000000000 to 255255255"))
            return ""
        }
        var r: String = ""
        var g: String = ""
        var b: String = ""
        for (index, color) in RGB.enumerated() {
            switch index {
            case 0...2:
                r += String(color)
            case 3...5:
                g += String(color)
            case 6...8:
                b += String(color)
            default:
                print(ColorError.RBGFormattingError(Error: "RGB String is not formatted correctly. To fix please format string with three values for each color. ie 000000000 to 255255255"))
                return ""
            }
        }
       return RGBToHex(red: Int(r)!, green: Int(g)!, blue: Int(b)!)
    }
    
   public static func RGBToHex(red: Int, green: Int, blue: Int) -> String {
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
    
}
