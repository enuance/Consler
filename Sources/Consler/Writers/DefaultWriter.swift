//
//  DefaultWriter.swift
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

/// Default Output Stream for Errors
private struct StderrOutputStream: TextOutputStream {
    mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

/// When TTY is not available, we still need a way to output to the TextOutputStream.
/// DefaultWriter allows us to do that.
internal struct DefaultWriter {
    
    let outputType: Consler.OutputType
    
    private let nextLine = "\n"
    
    func writeError(_ value: String) {
        var standardError = StderrOutputStream()
        print(value, to: &standardError)
    }
    
    func writeStandard(_ value: String) {
        print(value)
    }
    
    func output(values: [String], descriptors: [OutputDescriptor] = []) {
        guard !values.isEmpty else { return }
        let descriptors = descriptors.matchCount(of: values)
        var nextLineCandidates = Array(descriptors.map { $0.endsLine }.dropLast())
        
        // Both writers already terminate with next line
        nextLineCandidates.append(false)
        
        let formattedValue = zip(values, nextLineCandidates)
            .map { $1 ? $0 + nextLine : $0 }
            .joined()
        
        switch outputType {
        case .standard:
            writeStandard(formattedValue)
        case .error:
            writeError(formattedValue)
        }
        
    }
    
    func output(values: [String], appliedDescriptors: [AppliedDescriptor]) {
        guard !values.isEmpty else { return }
        
        let validIndexRange = values.startIndex..<values.endIndex
        
        let validatedAppDescriptors = appliedDescriptors.map { appDescriptor -> AppliedDescriptor in
            let validIndices = appDescriptor.applicationIndices.filter { validIndexRange.contains($0) }
            return AppliedDescriptor(descriptor: appDescriptor.descriptor, applicationIndices: validIndices)
        }
        
        var descriptors = [OutputDescriptor]().matchCount(of: values)
        
        validatedAppDescriptors.forEach { appDescriptor in
            appDescriptor.applicationIndices.forEach { descriptors[$0] = appDescriptor.descriptor }
        }
        
        var nextLineCandidates = Array(descriptors.map { $0.endsLine }.dropLast())
        
        // Both writers already terminate with next line
        nextLineCandidates.append(false)
        
        let formattedValue = zip(values, nextLineCandidates)
            .map { $1 ? $0 + nextLine : $0 }
            .joined()
        
        switch outputType {
        case .standard:
            writeStandard(formattedValue)
        case .error:
            writeError(formattedValue)
        }
        
    }
    
}
