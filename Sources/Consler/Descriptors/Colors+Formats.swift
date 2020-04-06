//
//  Colors+Formats.swift
//  Consler
//
//  MIT License
//
//  Copyright (c) 2020 STEPHEN L. MARTINEZ
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

// Formatting documentation pulled from https://misc.flogisoft.com/bash/tip_colors_and_formatting

protocol FormatTranslatable {
    
    var from: String { get }
    
    var translated: String { get }
    
}

internal struct EscapedTranslation: FormatTranslatable, ExpressibleByStringLiteral, Equatable {
    
    private let value: String
    
    private static let escapeSequence = "\u{001B}"
    
    internal init(stringLiteral value: String) {
        self.value = value
    }
    
    internal var from: String { value }
    
    internal var translated: String { Self.translate(from: value) }
    
    internal static func translate(from value: String) -> String {
        Self.escapeSequence + value
    }
    
}

extension EscapedTranslation {
    
    /// Clears the entire line
    static let clearLine: EscapedTranslation = "[2K"

    /// Unsets all active formating and attributes
    static let reset: EscapedTranslation = "[0m"
    
    // MARK: - Currently unset api is unused
    
    /// Unsets the bold attribute
    static let unsetBold: EscapedTranslation = "[21m"
    
    /// Unsets the dim attribute
    static let unsetDim: EscapedTranslation = "[22m"
    
    /// Unsets the underline attribute
    static let unsetUnderline: EscapedTranslation = "[24m"
    
    /// Unsets the blinking attribute
    static let unsetBlink: EscapedTranslation = "[25m"
    
    /// Unsets the format inversion attribute
    static let unsetInvert: EscapedTranslation = "[27m"
    
    /// Unsets the hidden attribute
    static let unsetHidden: EscapedTranslation = "[28m"
    
}

public enum TextFormat: FormatTranslatable {
    
    /// Applies the bold attribute
    case bold
    
    /// Applies the dim attribute
    case dim
    
    /// Applies the underline attribute
    case underline
    
    /// Applies the blinking attribute
    case blink
    
    /// Applies the format inversion attribute
    case invert
    
    /// Applies the hidden attribute
    case hidden
    
    internal var from: String {
        
        switch self {
            
        case .bold: return "[1m"
        case .dim: return "[2m"
        case .underline: return "[4m"
        case .blink: return "[5m"
        case .invert: return "[7m"
        case .hidden: return "[8m"
            
        }
        
    }
    
    internal var translated: String { EscapedTranslation.translate(from: from) }
    
}

public enum TextColor: FormatTranslatable {
    
    // Compatible with 8 color (or more) systems
    case normal
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case lightGray
    
    // Compatible with 16 color (or more) systems
    case darkGray
    case lightRed
    case lightGreen
    case lightYellow
    case lightBlue
    case lightMagenta
    case lightCyan
    case white
    
    // Compatible with 256 color systems
    case detailed(UInt8)
    
    internal var from: String {
        
        switch self {
            
        case .normal: return "[39m"
        case .black: return "[30m"
        case .red: return "[31m"
        case .green: return "[32m"
        case .yellow: return "[33m"
        case .blue: return "[34m"
        case .magenta: return "[35m"
        case .cyan: return "[36m"
        case .lightGray: return "[37m"
            
        case .darkGray: return "[90m"
        case .lightRed: return "[91m"
        case .lightGreen: return "[92m"
        case .lightYellow: return "[93m"
        case .lightBlue: return "[94m"
        case .lightMagenta: return "[95m"
        case .lightCyan: return "[96m"
        case .white: return "[97m"
            
        case let .detailed(colorValue): return "[38;5;\(colorValue)m"
            
        }
        
    }
    
    internal var translated: String { EscapedTranslation.translate(from: from) }
    
}

public enum BackgroundColor: FormatTranslatable {
    
    // Compatible with 8 color (or more) systems
    case normal
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case lightGray
    
    // Compatible with 16 color (or more) systems
    case darkGray
    case lightRed
    case lightGreen
    case lightYellow
    case lightBlue
    case lightMagenta
    case lightCyan
    case white
    
    // Compatible with 256 color systems
    case detailed(UInt8)
    
    internal var from: String {
        
        switch self {
            
        case .normal: return "[49m"
        case .black: return "[40m"
        case .red: return "[41m"
        case .green: return "[42m"
        case .yellow: return "[43m"
        case .blue: return "[44m"
        case .magenta: return "[45m"
        case .cyan: return "[46m"
        case .lightGray: return "[47m"
            
        case .darkGray: return "[100m"
        case .lightRed: return "[101m"
        case .lightGreen: return "[102m"
        case .lightYellow: return "[103m"
        case .lightBlue: return "[104m"
        case .lightMagenta: return "[105m"
        case .lightCyan: return "[106m"
        case .white: return "[107m"
            
        case let .detailed(colorValue): return "[48;5;\(colorValue)m"
            
        }
        
    }
    
    internal var translated: String { EscapedTranslation.translate(from: from) }
    
}
