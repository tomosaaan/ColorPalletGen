import Foundation
import PathKit
import AppKit

struct ColorPallet {
    var name: String
    var colors: [String: UInt32]

    func write() -> Bool {
        let colorList = NSColorList(name: .init(rawValue: name))
        for (key, value) in colors {
            colorList.setColor(NSColor.init(hex: value), forKey: .init(key))
        }
        return colorList.write(toFile: nil)
    }
}

extension NSColor {
    convenience public init(hex: UInt32) {
        let r = CGFloat((hex & 0xFF000000) >> 24) / 255.0
        let g = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
        let b = CGFloat((hex & 0x0000FF00) >>  8) / 255.0
        let a = CGFloat(hex & 0x000000FF)        / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

protocol FileParser: AnyObject {
    static var `extension`: String { get }
    static func parse(path: Path) throws -> ColorPallet
}
