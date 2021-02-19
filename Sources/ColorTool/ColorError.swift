import Foundation

enum ColorError: Error{
    case RGBOutOfBoundsError(Error: String)
    case RGBFormattingError(Error: String)
    case HEXFormattingError(Error: String)
    case CMYKOutOfBoundsError(Error: String)
    case CMYKFormattingError(Error: String)
}
