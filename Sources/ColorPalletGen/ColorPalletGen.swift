import Foundation
import PathKit

public final class ColorPalletGen {
    let filePath: String
    var parsers: [String: FileParser.Type] = [:]
    
    init(filePath: String) {
        self.filePath = filePath
        registerParser(JSONFileParser.self)
    }
    
    private func registerParser(_ parserType: FileParser.Type) {
        parsers[parserType.extension] = parserType
    }
    
    func execute() throws {
        let path = Path(filePath)
        let fileExt = path.extension?.lowercased() ?? ""
        guard let parser = parsers[fileExt] else {
            throw ColorPalletGenError.unsuppotedFileType(ext: fileExt)
        }

        do {
            let pallet = try parser.parse(path: path)
            if !pallet.write() {
                throw ColorPalletGenError.cannotGenerated(filePath: filePath)
            }
        } catch let error {
            throw error
        }
    }
}
