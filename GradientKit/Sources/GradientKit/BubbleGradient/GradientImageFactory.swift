//
//  GradientImageFactory.swift
//
//
//  Created by Gleb Fandeev on 04.06.2023.
//

import Foundation
import CoreGraphics

enum GradientImageFactory {
    static func make(from pixels: [ARGB], width: Int, height: Int) -> CGImage? {
        guard width > 0 && height > 0 else { return nil }
        guard pixels.count == width * height else { return nil }

        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        let bitsPerComponent = 8
        let bitsPerPixel = 32

        var data = pixels
        guard let providerRef = CGDataProvider(
            data: NSData(
                bytes: &data,
                length: data.count * MemoryLayout<ARGB>.size
            )
        ) else { return nil }

        return CGImage(
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bitsPerPixel: bitsPerPixel,
            bytesPerRow: width * MemoryLayout<ARGB>.size,
            space: rgbColorSpace,
            bitmapInfo: bitmapInfo,
            provider: providerRef,
            decode: nil,
            shouldInterpolate: true,
            intent: .defaultIntent
        )
    }
}
