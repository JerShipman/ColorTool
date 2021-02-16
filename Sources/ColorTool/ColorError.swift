import Foundation

enum ColorError: Error{
    case RGBOutOfBoundsError(Error: String)
    case RBGFormattingError(Error: String)
    case HEXFormattingError(Error: String)
}
