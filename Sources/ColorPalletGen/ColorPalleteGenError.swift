import Foundation

enum ColorPalletGenError: Error {
    case parseError(filePath: String)
    case invalidColor(hex: String)
    case unsuppotedFileType(ext: String)
    case cannotGenerated(filePath: String)

    var description: String {
        switch self {
        case .parseError(let filePath):
            return """
            error: Parse Error for \(filePath). Please check \(filePath) form.
            """
        case .invalidColor(let hex):
            return """
            error: Invalid hexColor `\(hex)`
            """
        case .unsuppotedFileType(let ext):
            return """
            error: Unsuppoted file type for \(ext)
            """
        case .cannotGenerated(let filePath):
            return """
            error Cannot generated .clr file for \(filePath)
            """
        }
    }
}
