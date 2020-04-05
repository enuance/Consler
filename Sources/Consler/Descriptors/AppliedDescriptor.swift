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
    
    static func normal(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .normal, applicationIndices: positions)
    }
    
    static func endsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .endsLine, applicationIndices: positions)
    }
    
    static func normal(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .normal(formats) , applicationIndices: positions)
    }
    
    static func endsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .endsLine(formats) , applicationIndices: positions)
    }
    
    
    static func red(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .red, applicationIndices: positions)
    }
    
    static func redEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .redEndsLine, applicationIndices: positions)
    }
    
    static func red(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .red(formats) , applicationIndices: positions)
    }
    
    static func redEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .redEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func black(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .black, applicationIndices: positions)
    }
    
    static func blackEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blackEndsLine, applicationIndices: positions)
    }
    
    static func black(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .black(formats) , applicationIndices: positions)
    }
    
    static func blackEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blackEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func green(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .green, applicationIndices: positions)
    }
    
    static func greenEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .greenEndsLine, applicationIndices: positions)
    }
    
    static func green(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .green(formats) , applicationIndices: positions)
    }
    
    static func greenEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .greenEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func yellow(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellow, applicationIndices: positions)
    }
    
    static func yellowEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellowEndsLine, applicationIndices: positions)
    }
    
    static func yellow(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellow(formats) , applicationIndices: positions)
    }
    
    static func yellowEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellowEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func magenta(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magenta, applicationIndices: positions)
    }
    
    static func magentaEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magentaEndsLine, applicationIndices: positions)
    }
    
    static func magenta(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magenta(formats) , applicationIndices: positions)
    }
    
    static func magentaEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .magentaEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func cyan(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyan, applicationIndices: positions)
    }
    
    static func cyanEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyanEndsLine, applicationIndices: positions)
    }
    
    static func cyan(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyan(formats) , applicationIndices: positions)
    }
    
    static func cyanEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyanEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func gray(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .gray, applicationIndices: positions)
    }
    
    static func grayEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .grayEndsLine, applicationIndices: positions)
    }
    
    static func gray(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .gray(formats) , applicationIndices: positions)
    }
    
    static func grayEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .grayEndsLine(formats) , applicationIndices: positions)
    }
    
    
    static func white(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .white, applicationIndices: positions)
    }
    
    static func whiteEndsLine(_ positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .whiteEndsLine, applicationIndices: positions)
    }
    
    static func white(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .white(formats) , applicationIndices: positions)
    }
    
    static func whiteEndsLine(_ formats: Set<TextFormat>, positions: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .whiteEndsLine(formats) , applicationIndices: positions)
    }
    
    static func custom(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = [],
        positions: Int...
    ) -> AppliedDescriptor {
        let descriptor = OutputDescriptor(color: color, background: background, formats: formats, endsLine: false)
        return AppliedDescriptor(descriptor: descriptor, applicationIndices: positions)
    }
    
    static func customEndsLine(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = [],
        positions: Int...
    ) -> AppliedDescriptor {
        let descriptor = OutputDescriptor(color: color, background: background, formats: formats, endsLine: true)
        return AppliedDescriptor(descriptor: descriptor, applicationIndices: positions)
    }
    
}
