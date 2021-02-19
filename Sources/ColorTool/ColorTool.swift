import Foundation

public struct ColorTool {
    //MARK: - RGB string to RGB array
    public static func toRGBArray(RGBString: String) -> [Int]{
        //takes the string that is seperated by a comma and puts them in a new array with the deleminator being a ","
        //once it does that it will will return the values which is red - RGBIntArray[0], green - RGBIntArray[1], blue - RGBIntArray[2]
        let RGBStringArray : [String] = RGBString.components(separatedBy: ",")
        var RGBIntArray : [Int] = []
        for val in RGBStringArray{
            RGBIntArray.append(Int(val)!)
        }
        return RGBIntArray
    }
    
    //MARK: - RGB To Hex
    //overloaded method to allow multiple types of parameters in what ever format the user needs. But all just call the primary method in the correct format
    public static func RGBToHex(RGBcolor: RGBColor) -> String{
        return RGBToHex(red: Int(RGBcolor.red), green: Int(RGBcolor.green), blue: Int(RGBcolor.blue))
    }
    public static func RGBToHex(RGBString: String) -> String{
        let rgbArray: [Int] = toRGBArray(RGBString: RGBString)
        return RGBToHex(red: rgbArray[0], green: rgbArray[1], blue: rgbArray[2])
    }
   public static func RGBToHex(red: Int, green: Int, blue: Int) -> String {
        var hexValue: String = "#"
        //first this will verify that the color value is between 0 and 255 and if not it will print an error otherwise it appends the color value in hex form to hexValue. by printing it the user wont have to put the color in a try catch.
        if(0..<256 ~= red){
            hexValue += String(format:"%02X", red)
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
    //MARK: - RBG To CMYK
    public static func RGBToCMYK(red: Int, green: Int, blue: Int)->String{
        var redC: Double
        var greenC: Double
        var blueC: Double
        if(0..<256 ~= red){
            redC = (Double(red)/255) * 100
        } else {
            print(ColorError.RGBOutOfBoundsError(Error: "red value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= green){
            greenC = (Double(green)/255) * 100
        } else {
           print(ColorError.RGBOutOfBoundsError(Error: "green value is not between 0 and 255"))
            return ""
        }
        if(0..<256 ~= blue){
            blueC = (Double(blue)/255) * 100
        } else {
          print(ColorError.RGBOutOfBoundsError(Error: "blue value is not between 0 and 255"))
            return ""
        }
        
        //k will be the largest value of either redC, greenC, or blueC.
        let k = 100 - max(max(redC, greenC), blueC)
        var kInt: Int
        if k == 100{
            return "0,0,0,100"
        }else{
            kInt = Int(round(k))
        }
        
        let c = Int(round((100 - redC - k) / (100 - k) * 100))
        let m = Int(round((100 - greenC - k) / (100 - k) * 100))
        let y = Int(round((100 - blueC - k) / (100 - k) * 100))
        return("\(c),\(m),\(y),\(kInt)" )
    }
    
    //MARK: - HEX to X
    
    public static func HexToRGB(Hex: String) -> String{
        if (!(6..<11 ~= Hex.count)){
            //hex string format is not FFFFFF or #FFFFFF or 0xFFFFFF or #0xFFFFFF
            print(ColorError.HEXFormattingError(Error: "Hex string is not formatted correctly"))
            return ""
        }

        var r = ""
        var g = ""
        var b = ""
        func extractRGB(indexAdjust: Int){
            for (index, color) in Hex.enumerated() {
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
        if (Hex.lowercased().hasPrefix("#0x") || Hex.lowercased().hasPrefix("#0b")) && (Hex.count == 9){
            extractRGB(indexAdjust: 3)
        }else if (Hex.lowercased().hasPrefix("0x") || Hex.lowercased().hasPrefix("0b")) && (Hex.count == 8){
          extractRGB(indexAdjust: 2)
        }else if (Hex.hasPrefix("#") && (Hex.count == 7)){
            extractRGB(indexAdjust: 1)
        }else if (Hex.count == 6){
           extractRGB(indexAdjust: 0)
        }else{
            print(ColorError.HEXFormattingError(Error: "Hex string is not formatted correctly or is out of bounds. To fix format hex like #0xFFFFFF or #FFFFFF or FFFFFF"))
            return""
        }
        r = String(format:"%03D", Int(r, radix: 16)!)
        g = String(format:"%03D", Int(g, radix: 16)!)
        b = String(format:"%03D", Int(b, radix: 16)!)
        return "\(r),\(g),\(b)"
    }
    
    public static func HexToCMYK(Hex: String) -> String{
        //first convert hex to RGBstring and then to RGBarray
        let rgbArray : [Int] = toRGBArray(RGBString: HexToRGB(Hex: Hex))
        //convert rgb to CMYK
        return RGBToCMYK(red: rgbArray[0], green: rgbArray[1], blue: rgbArray[2])
        
    }
    
    
    //MARK: - CMYK to X
    public static func toCMYKArray(CMYKString: String) -> [Int]{
        let CMYKStringArray : [String] = CMYKString.components(separatedBy: ",")
        var CYMKIntArray : [Int] = []
        for val in CMYKStringArray{
            CYMKIntArray.append(Int(val)!)
        }
        return CYMKIntArray
    }
    public static func CMYKToRGB(C: Int, M: Int, Y: Int, K: Int) -> String{
        var r: Double
        var g: Double
        var b: Double
        if !(0...100 ~= K){
            print(ColorError.CMYKOutOfBoundsError(Error: "Value for K is not between 0 and 100"))
            return ""
        }
        if(0...100 ~= C){
            r = round(255 * (1 - Double(C)/100) * (1 - Double(K)/100))
        }else{
            print(ColorError.CMYKOutOfBoundsError(Error: "Value for C is not between 0 and 100"))
            return ""
        }
        if(0...100 ~= M){
            g = round(255 * (1 - Double(M)/100) * (1 - Double(K)/100))
        }else{
            print(ColorError.CMYKOutOfBoundsError(Error: "Value for M is not between 0 and 100"))
            return ""
        }
        if(0...100 ~= Y){
          b = round(255 * (1 - Double(Y)/100) * (1 - Double(K)/100))
        }else{
            print(ColorError.CMYKOutOfBoundsError(Error: "Value for Y is not between 0 and 100"))
            return ""
        }
        return String(format:"%03.0f,%03.0f,%03.0f", r,g,b)
    }
    public static func CMYKToHex(C: Int, M: Int, Y: Int, K: Int) -> String{
        return RGBToHex(RGBString: CMYKToRGB(C: C, M: M, Y: Y, K: K))
    }

    
}
