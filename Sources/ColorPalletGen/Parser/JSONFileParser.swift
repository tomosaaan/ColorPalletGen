import Foundation
import PathKit
import AppKit

extension ColorPalletGen {
    final class JSONFileParser: FileParser {
        static var `extension`: String {
            return "json"
        }
        
        static func parse(path: Path) throws -> ColorPallet {
            let object = try? JSONSerialization.jsonObject(with: path.read(), options: [])
            guard let jsonDict = object as? [String: String] else {
                throw ColorPalletGenError.parseError(filePath: path.description)
            }
            let name = path.lastComponentWithoutExtension
            let list = jsonDict.mapValues { (try? Color.parse(hexString: $0)) ?? 0xFFFFFF }
            return .init(name: name, colors: list)
        }
    }
}
