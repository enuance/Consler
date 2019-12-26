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

import Foundation

public struct AppliedDescriptor {
    
    let descriptor: OutputDescriptor
    let applicationIndices: [Int]
    
    internal init(descriptor: OutputDescriptor, applicationIndices: [Int]) {
        self.descriptor = descriptor
        self.applicationIndices = applicationIndices
    }
    
}

public extension AppliedDescriptor {
    
    static func normal(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .normal, applicationIndices: applicationDescriptors)
    }
    
    static func bold(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .bold, applicationIndices: applicationDescriptors)
    }
    
    static func endsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .endsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func red(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .red, applicationIndices: applicationDescriptors)
    }
    
    static func redEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .redEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldRed(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldRed, applicationIndices: applicationDescriptors)
    }
    
    static func boldRedEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldRedEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func green(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .green, applicationIndices: applicationDescriptors)
    }
    
    static func greenEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .greenEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldGreen(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldGreen, applicationIndices: applicationDescriptors)
    }
    
    static func boldGreenEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldGreenEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func yellow(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellow, applicationIndices: applicationDescriptors)
    }
    
    static func yellowEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .yellowEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldYellow(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldYellow, applicationIndices: applicationDescriptors)
    }
    
    static func boldYellowEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldYellowEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func cyan(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyan, applicationIndices: applicationDescriptors)
    }
    
    static func cyanEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .cyanEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldCyan(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldCyan, applicationIndices: applicationDescriptors)
    }
    
    static func boldCyanEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldCyanEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func white(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .white, applicationIndices: applicationDescriptors)
    }
    
    static func whiteEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .whiteEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldWhite(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldWhite, applicationIndices: applicationDescriptors)
    }
    
    static func boldWhiteEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldWhiteEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func black(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .black, applicationIndices: applicationDescriptors)
    }
    
    static func blackEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .blackEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldBlack(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldBlack, applicationIndices: applicationDescriptors)
    }
    
    static func boldBlackEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldBlackEndsLine, applicationIndices: applicationDescriptors)
    }
    

    static func gray(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .gray, applicationIndices: applicationDescriptors)
    }
    
    static func grayEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .grayEndsLine, applicationIndices: applicationDescriptors)
    }
    
    static func boldGrey(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldGrey, applicationIndices: applicationDescriptors)
    }
    
    static func boldGreyEndsLine(_ applicationDescriptors: Int...) -> AppliedDescriptor {
        AppliedDescriptor(descriptor: .boldGreyEndsLine, applicationIndices: applicationDescriptors)
    }
    
}
