import Foundation
import PathKit
import AppKit

protocol FileParser: AnyObject {
    static var `extension`: String { get }
    static func parse(path: Path) throws -> ColorPallet
}
