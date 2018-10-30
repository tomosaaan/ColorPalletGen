import Foundation
import Commander

let main = command(Option("file-read", default: "")) { filePath in
    let generator = ColorPalletGen(filePath: filePath)

    do {
        try generator.execute()
    } catch let error as ColorPalletGenError {
        print(error.description)
    } catch let error {
        print(error)
    }
}

main.run()

