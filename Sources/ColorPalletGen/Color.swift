import Foundation

enum Color {
    enum Prefix {
        case shape
        case hexaDecimal
        case none
        
        var length: Int {
            switch self {
            case .shape:
                return 1
            case .hexaDecimal:
                return 2
            case .none:
                return 0
            }
        }
        
        static func value(from scanner: Scanner) -> Prefix {
            if scanner.scanString("#", into: nil) {
                return .shape
            } else if scanner.scanString("0x", into: nil) {
                return .hexaDecimal
            } else {
                return .none
            }
        }
    }
    
    static func parse(hexString: String, key: String? = nil) throws -> UInt32 {
        let scanner = Scanner(string: hexString)
        let prefix = Prefix.value(from: scanner)
        var value: UInt32 = 0
        guard scanner.scanHexInt32(&value) else {
            throw ColorPalletGenError.invalidColor(hex: hexString)
        }
        let isAlphaComponent = hexString.lengthOfBytes(using: .utf8) - prefix.length == 6
        return isAlphaComponent ? ((value << 8) | 0xff) : value
    }
}

