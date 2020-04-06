//
//  AppliedDescriptor.swift
//  Consler
//
//  MIT License
//
//  Copyright (c) 2019 STEPHEN L. MARTINEZ
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

/// Convenience Type for transmitting Applied Consler Descriptors to eventually be outputed by Consler
public struct AppliedDescriptor {

    let descriptor: OutputDescriptor
    let applicationIndices: [Int]
    
    internal init(descriptor: OutputDescriptor, applicationIndices: [Int]) {
        self.descriptor = descriptor
        self.applicationIndices = applicationIndices
    }
    
}

public extension AppliedDescriptor {
    
    static func normal(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .normal, applicationIndices: positions)
    }
    
    static func endsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .endsLine, applicationIndices: positions)
    }
    
    static func normal(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .normal, formats: formats),
            applicationIndices: positions)
    }
    
    static func endsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .normal, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func black(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .black, applicationIndices: positions)
    }
    
    static func blackEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blackEndsLine, applicationIndices: positions)
    }
    
    static func black(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .black, formats: formats),
            applicationIndices: positions)
    }
    
    static func blackEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .black, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func red(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .red, applicationIndices: positions)
    }
    
    static func redEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .redEndsLine, applicationIndices: positions)
    }
    
    static func red(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .red, formats: formats),
            applicationIndices: positions)
    }
    
    static func redEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .red, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func green(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .green, applicationIndices: positions)
    }
    
    static func greenEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .greenEndsLine, applicationIndices: positions)
    }
    
    static func green(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .green, formats: formats),
            applicationIndices: positions)
    }
    
    static func greenEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .green, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func yellow(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellow, applicationIndices: positions)
    }
    
    static func yellowEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellowEndsLine, applicationIndices: positions)
    }
    
    static func yellow(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .yellow, formats: formats),
            applicationIndices: positions)
    }
    
    static func yellowEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .yellow, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func blue(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blue, applicationIndices: positions)
    }
    
    static func blueEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blueEndsLine, applicationIndices: positions)
    }
    
    static func blue(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .blue, formats: formats),
            applicationIndices: positions)
    }
    
    static func blueEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .blue, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func magenta(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magenta, applicationIndices: positions)
    }
    
    static func magentaEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magentaEndsLine, applicationIndices: positions)
    }
    
    static func magenta(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .magenta, formats: formats),
            applicationIndices: positions)
    }
    
    static func magentaEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .magenta, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func cyan(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyan, applicationIndices: positions)
    }
    
    static func cyanEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyanEndsLine, applicationIndices: positions)
    }
    
    static func cyan(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .cyan, formats: formats),
            applicationIndices: positions)
    }
    
    static func cyanEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .cyan, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func gray(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .gray, applicationIndices: positions)
    }
    
    static func grayEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .grayEndsLine, applicationIndices: positions)
    }
    
    static func gray(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .lightGray, formats: formats),
            applicationIndices: positions)
    }
    
    static func grayEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .lightGray, formats: formats),
            applicationIndices: positions)
    }
    
    
    static func white(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .white, applicationIndices: positions)
    }
    
    static func whiteEndsLine(at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .whiteEndsLine, applicationIndices: positions)
    }
    
    static func white(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .custom(color: .white, formats: formats),
            applicationIndices: positions)
    }
    
    static func whiteEndsLine(_ formats: Set<TextFormat>, at positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(
            descriptor: .customEndsLine(color: .white, formats: formats),
            applicationIndices: positions)
    }
    
    static func custom(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = [],
        at positions: Int...
    ) -> AppliedDescriptor {
        let descriptor = OutputDescriptor(color: color, background: background, formats: formats, endsLine: false)
        return AppliedDescriptor(descriptor: descriptor, applicationIndices: positions)
    }
    
    static func customEndsLine(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = [],
        at positions: Int...
    ) -> AppliedDescriptor {
        let descriptor = OutputDescriptor(color: color, background: background, formats: formats, endsLine: true)
        return AppliedDescriptor(descriptor: descriptor, applicationIndices: positions)
    }
    
}
