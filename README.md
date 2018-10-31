# ColorPalletGen

Generate Color Pallet file(.clr) CLI Tool.

## How to install

### cocoapods

```
pod "ColorPalletGen"
```

## Usage

```
./ColorPalletGen --file-read ./Color.json
```

- Configuration file of color

```json
{
  "color1": "#ffffff", // RGB using prefix '#'
  "color2": "0xffffff", // RGB using prefix '0x'
  "color3": "#ffffff66" // RGBA
}
```

| File extension |          |
| :------------: | :------: |
|      json      | released |
|      txt       | feature  |

## Inspired

- [SwiftGen](https://github.com/SwiftGen/SwiftGen)

## LICENSE

Under the MIT license. See [LICENSE](https://github.com/tomokitalahashi/ColorPalletGen/blob/master/LICENSE) file for details.
