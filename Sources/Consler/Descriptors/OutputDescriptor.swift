//
//  OutputDescriptor.swift
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

import Basic
import Foundation

public extension Consler {
    
    struct OutputDescriptor {
        
        internal let textColor: TextColor
        internal let backgroundColor: BackgroundColor
        internal let formats: Set<TextFormat>
        internal let endsLine: Bool
        
        internal init(
            color: TextColor,
            background: BackgroundColor = .normal,
            formats: Set<TextFormat> = [],
            endsLine: Bool = false
        ) {
            self.textColor = color
            self.backgroundColor = background
            self.formats = formats
            self.endsLine = endsLine
        }
        
    }
    
}

public typealias OutputDescriptor = Consler.OutputDescriptor

// MARK: - OutputDescriptor Convenience Properties

public extension OutputDescriptor {
    
    static var normal: OutputDescriptor { OutputDescriptor(color: .normal) }
    
    static var endsLine: OutputDescriptor { OutputDescriptor(color: .normal, endsLine: true) }
    
    static func normal(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .normal, formats: formats)
    }
    
    static func endsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .normal, formats: formats, endsLine: true)
    }
    
    static var red: OutputDescriptor { OutputDescriptor(color: .red) }
    
    static var redEndsLine: OutputDescriptor { OutputDescriptor(color: .red, endsLine: true) }
    
    static func red(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .red, formats: formats)
    }
    
    static func redEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .red, formats: formats, endsLine: true)
    }
    
    static var black: OutputDescriptor { OutputDescriptor(color: .black) }
    
    static var blackEndsLine: OutputDescriptor { OutputDescriptor(color: .black, endsLine: true) }
    
    static func black(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .black, formats: formats)
    }
    
    static func blackEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .black, formats: formats, endsLine: true)
    }
    
    static var green: OutputDescriptor { OutputDescriptor(color: .green) }
    
    static var greenEndsLine: OutputDescriptor { OutputDescriptor(color: .green, endsLine: true) }
    
    static func green(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .green, formats: formats)
    }
    
    static func greenEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .green, formats: formats, endsLine: true)
    }
    
    static var yellow: OutputDescriptor { OutputDescriptor(color: .yellow) }
    
    static var yellowEndsLine: OutputDescriptor { OutputDescriptor(color: .yellow, endsLine: true) }
    
    static func yellow(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .yellow, formats: formats)
    }
    
    static func yellowEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .yellow, formats: formats, endsLine: true)
    }
    
    static var magenta: OutputDescriptor { OutputDescriptor(color: .magenta) }
    
    static var magentaEndsLine: OutputDescriptor { OutputDescriptor(color: .magenta, endsLine: true) }
    
    static func magenta(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .magenta, formats: formats)
    }
    
    static func magentaEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .magenta, formats: formats, endsLine: true)
    }
    
    
    static var cyan: OutputDescriptor { OutputDescriptor(color: .cyan) }
    
    static var cyanEndsLine: OutputDescriptor { OutputDescriptor(color: .cyan, endsLine: true) }
    
    static func cyan(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .cyan, formats: formats)
    }
    
    static func cyanEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .cyan, formats: formats, endsLine: true)
    }
    
    
    static var gray: OutputDescriptor { OutputDescriptor(color: .lightGray) }
    
    static var grayEndsLine: OutputDescriptor { OutputDescriptor(color: .lightGray, endsLine: true) }
    
    static func gray(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .lightGray, formats: formats)
    }
    
    static func grayEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .lightGray, formats: formats, endsLine: true)
    }
    
    static var white: OutputDescriptor { OutputDescriptor(color: .white) }
    
    static var whiteEndsLine: OutputDescriptor { OutputDescriptor(color: .white, endsLine: true) }
    
    static func white(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .white, formats: formats)
    }
    
    static func whiteEndsLine(_ formats: Set<TextFormat>) -> OutputDescriptor {
        OutputDescriptor(color: .white, formats: formats, endsLine: true)
    }
    
    static func custom(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = []
    ) -> OutputDescriptor {
        OutputDescriptor(color: color, background: background, formats: formats, endsLine: false)
    }
    
    static func customEndsLine(
        color: TextColor,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = []
    ) -> OutputDescriptor {
        OutputDescriptor(color: color, background: background, formats: formats, endsLine: true)
    }
    
}

internal extension Array where Element == OutputDescriptor {
    
    func matchCount<T>(of matchingArray: Array<T>) -> [OutputDescriptor] {
        switch self.count {
        case let myCount where myCount > matchingArray.count:
            var newArray = self
            while newArray.count != matchingArray.count {
                newArray = newArray.dropLast()
            }
            return newArray
        case let myCount where myCount < matchingArray.count:
            var newArray = self
            while newArray.count != matchingArray.count {
                newArray.append(.normal)
            }
            return newArray
        case let myCount where myCount == matchingArray.count:
            return self
            
        default:
            return Array(repeating: .normal, count: matchingArray.count)
        }
        
    }
    
}
