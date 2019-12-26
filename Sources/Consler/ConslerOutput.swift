//
//  ConslerOutput.swift
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

/// Convenience Type for transmitting Consler Values to eventually be outputed by Consler
public struct ConslerOutput {
    
    internal enum DescriptorType {
        case normal
        case applied
    }
    
    internal let type: DescriptorType
    public let values: [String]
    public let descriptors: [OutputDescriptor]
    public let appliedDescriptors: [AppliedDescriptor]
    
    public init(_ values: String...) {
        self.type = .normal
        self.values = values
        self.descriptors = []
        self.appliedDescriptors = []
    }
    
    public init(values: [String], descriptors: [OutputDescriptor] = []) {
        self.type = .normal
        self.values = values
        self.descriptors = descriptors
        self.appliedDescriptors = []
    }
    
    public init(values: [String], appliedDescriptors: [AppliedDescriptor] = []) {
        self.type = .applied
        self.values = values
        self.descriptors = []
        self.appliedDescriptors = appliedDescriptors
    }
    
    public func describedBy(_ descriptors: OutputDescriptor...) -> ConslerOutput {
        ConslerOutput(values: self.values, descriptors: descriptors)
    }
    
    public func describedBy(_ descriptors: [OutputDescriptor]) -> ConslerOutput {
        ConslerOutput(values: self.values, descriptors: descriptors)
    }
    
    public func describedBy(_ appliedDescriptors: AppliedDescriptor...) -> ConslerOutput {
        ConslerOutput(values: self.values, appliedDescriptors: appliedDescriptors)
    }
    
    public func describedBy(_ appliedDescriptors: [AppliedDescriptor]) -> ConslerOutput {
        ConslerOutput(values: self.values, appliedDescriptors: appliedDescriptors)
    }
    
}
