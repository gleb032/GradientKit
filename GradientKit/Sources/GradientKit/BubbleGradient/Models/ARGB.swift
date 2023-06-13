//
//  ARGB.swift
//  
//
//  Created by Gleb Fandeev on 13.06.2023.
//

public struct ARGB {
    public let alpha: UInt8
    public let red: UInt8
    public let green: UInt8
    public let blue: UInt8

    public init(alpha: UInt8, red: UInt8, green: UInt8, blue: UInt8) {
        self.alpha = alpha
        self.red = red
        self.green = green
        self.blue = blue
    }
}
