# DynamicGrid
`DynamicGrid` is a horizontal stack for SwiftUI which moves the elements in the next line if there is not enough space in the current line.

## Requirements
iOS 16+ and macOS 13+

## Usage
The parameters `horizontalSpacing` and `verticalSpacing` are optional and default 0.
```swift
DynamicGrid(horizontalSpacing: 10, verticalSpacing: 10) {
    // other views
}
```

## Preview
<img src="./images/PreviewScreenshot.png" alt="Preview Screenshot of the DynamicGrid" width="200"/>
<img src="./images/PreviewVideo.gif" alt="Preview GIF of the DynamicGrid" width="200"/>

