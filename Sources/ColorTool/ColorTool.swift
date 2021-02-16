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
            case 0..<3:
                r += String(color)
            case 3..<6:
                g += String(color)
            case 6..<9:
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
            print(ColorError.RGBOutOfBoundsError(Error: "R value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= green){
            hexValue += String(format:"%02X", green)
        } else {
           print(ColorError.RGBOutOfBoundsError(Error: "G value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= blue){
            hexValue += String(format:"%02X", blue)
        } else { 
          print(ColorError.RGBOutOfBoundsError(Error: "B value is not between 0 and 255"))
            return ""
        }
        return hexValue
    }
    
}
