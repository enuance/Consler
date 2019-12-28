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
        
        internal let color: Color
        internal let isBold: Bool
        internal let endsLine: Bool
        
        internal init(color: Color, isBold: Bool, endsLine: Bool) {
            self.color = color
            self.isBold = isBold
            self.endsLine = endsLine
        }
        
    }
    
}

public typealias OutputDescriptor = Consler.OutputDescriptor

// MARK: - OutputDescriptor Convenience Properties
public extension OutputDescriptor {

    static var normal: OutputDescriptor { OutputDescriptor(color: .noColor, isBold: false, endsLine: false) }
    static var bold: OutputDescriptor { OutputDescriptor(color: .noColor, isBold: true, endsLine: false) }
    static var endsLine: OutputDescriptor { OutputDescriptor(color: .noColor, isBold: false, endsLine: true) }
    static var boldEndsLine: OutputDescriptor { OutputDescriptor(color: .noColor, isBold: true, endsLine: true) }

    static var red: OutputDescriptor { OutputDescriptor(color: .red, isBold: false, endsLine: false) }
    static var redEndsLine: OutputDescriptor { OutputDescriptor(color: .red, isBold: false, endsLine: true) }
    static var boldRed: OutputDescriptor { OutputDescriptor(color: .red, isBold: true, endsLine: false) }
    static var boldRedEndsLine: OutputDescriptor { OutputDescriptor(color: .red, isBold: true, endsLine: true) }

    static var green: OutputDescriptor { OutputDescriptor(color: .green, isBold: false, endsLine: false) }
    static var greenEndsLine: OutputDescriptor { OutputDescriptor(color: .green, isBold: false, endsLine: true) }
    static var boldGreen: OutputDescriptor { OutputDescriptor(color: .green, isBold: true, endsLine: false) }
    static var boldGreenEndsLine: OutputDescriptor { OutputDescriptor(color: .green, isBold: true, endsLine: true) }

    static var yellow: OutputDescriptor { OutputDescriptor(color: .yellow, isBold: false, endsLine: false) }
    static var yellowEndsLine: OutputDescriptor { OutputDescriptor(color: .yellow, isBold: false, endsLine: true) }
    static var boldYellow: OutputDescriptor { OutputDescriptor(color: .yellow, isBold: true, endsLine: false) }
    static var boldYellowEndsLine: OutputDescriptor { OutputDescriptor(color: .yellow, isBold: true, endsLine: true) }

    static var cyan: OutputDescriptor { OutputDescriptor(color: .cyan, isBold: false, endsLine: false) }
    static var cyanEndsLine: OutputDescriptor { OutputDescriptor(color: .cyan, isBold: false, endsLine: true) }
    static var boldCyan: OutputDescriptor { OutputDescriptor(color: .cyan, isBold: true, endsLine: false) }
    static var boldCyanEndsLine: OutputDescriptor { OutputDescriptor(color: .cyan, isBold: true, endsLine: true) }

    static var white: OutputDescriptor { OutputDescriptor(color: .white, isBold: false, endsLine: false) }
    static var whiteEndsLine: OutputDescriptor { OutputDescriptor(color: .white, isBold: false, endsLine: true) }
    static var boldWhite: OutputDescriptor { OutputDescriptor(color: .white, isBold: true, endsLine: false) }
    static var boldWhiteEndsLine: OutputDescriptor { OutputDescriptor(color: .white, isBold: true, endsLine: true) }

    static var black: OutputDescriptor { OutputDescriptor(color: .black, isBold: false, endsLine: false) }
    static var blackEndsLine: OutputDescriptor { OutputDescriptor(color: .black, isBold: false, endsLine: true) }
    static var boldBlack: OutputDescriptor { OutputDescriptor(color: .black, isBold: true, endsLine: false) }
    static var boldBlackEndsLine: OutputDescriptor { OutputDescriptor(color: .black, isBold: true, endsLine: true) }

    static var gray: OutputDescriptor { OutputDescriptor(color: .grey, isBold: false, endsLine: false) }
    static var grayEndsLine: OutputDescriptor { OutputDescriptor(color: .grey, isBold: false, endsLine: true) }
    static var boldGrey: OutputDescriptor { OutputDescriptor(color: .grey, isBold: true, endsLine: false) }
    static var boldGreyEndsLine: OutputDescriptor { OutputDescriptor(color: .grey, isBold: true, endsLine: true) }

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
