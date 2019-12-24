//
//  Consler.swift
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

public struct Consler {
    
    internal typealias Color = TerminalController.Color
    
    public enum OutputType {
        case standard
        case error
    }
    
    public struct OutputDescriptor {
        
        internal let color: Color
        internal let isBold: Bool
        internal let endsLine: Bool
        
        internal init(color: Color, isBold: Bool, endsLine: Bool) {
            self.color = color
            self.isBold = isBold
            self.endsLine = endsLine
        }
        
    }
    
    private struct DescribedOutput {
        let outputValue: String
        let endsLine: Bool
        
        private init(outputValue: String, endsLine: Bool) {
            self.outputValue = outputValue
            self.endsLine = endsLine
        }
        
        init(_ rawValue: String, descriptor: OutputDescriptor = .normal, controller: TerminalController) {
            let newOutputValue = controller.wrap(rawValue, inColor: descriptor.color, bold: descriptor.isBold)
            self.init(outputValue: newOutputValue, endsLine: descriptor.endsLine)
        }
        
    }
    
    static private var standardOut: TerminalController? { nil } //TerminalController(stream: stdoutStream) }
    static private var standardErr: TerminalController? { nil } //TerminalController(stream: stderrStream) }
    
    static public func output(type: OutputType = .standard, descriptors: [OutputDescriptor] = [], values: [String]) {
        let controller = type == .standard ? Consler.standardOut : Consler.standardErr
        guard let selectedController = controller, !values.isEmpty else {
            DefaultSTDIO(outputType: type).output(descriptors: descriptors, values: values)
            return
        }
        let descriptors = descriptors.matchCount(of: values)
        let describedOutputs = zip(values, descriptors)
            .map { DescribedOutput($0, descriptor: $1, controller: selectedController) }
        
        describedOutputs.forEach { description in
            selectedController.write(description.outputValue)
            if description.endsLine { selectedController.endLine() }
        }
        
        let lastDescriptionEndsLine = describedOutputs.last?.endsLine ?? false
        if !lastDescriptionEndsLine { selectedController.endLine() }
        
    }
    
    static public func output(type: OutputType = .standard, descriptors: [OutputDescriptor] = [], values: String...) {
        output(type: type, descriptors: descriptors, values: values)
    }
    
    static public func output(type: OutputType = .standard, descriptor: OutputDescriptor = .normal, value: String) {
        output(type: type, descriptors: [descriptor], values: [value])
    }
    
    static public func output(type: OutputType = .standard, appliedDescriptors: [AppliedDescriptor], values: [String]) {
        let controller = type == .standard ? Consler.standardOut : Consler.standardErr
        guard let selectedController = controller, !values.isEmpty, !appliedDescriptors.isEmpty else { return }
        let validIndexRange = values.startIndex..<values.endIndex
        
        let validatedAppDescriptors = appliedDescriptors.map { appDescriptor -> AppliedDescriptor in
            let validIndices = appDescriptor.valueIndices.filter { validIndexRange.contains($0) }
            return (descriptor: appDescriptor.descriptor, valueIndices: validIndices)
        }
        
        var descriptors = [OutputDescriptor]().matchCount(of: values)
        
        validatedAppDescriptors.forEach { appDescriptor in
            appDescriptor.valueIndices.forEach { descriptors[$0] = appDescriptor.descriptor }
        }
        
        let describedOutputs = zip(values, descriptors)
            .map { DescribedOutput($0, descriptor: $1, controller: selectedController) }
        
        describedOutputs.forEach { description in
            selectedController.write(description.outputValue)
            if description.endsLine { selectedController.endLine() }
        }
        
        let lastDescriptionEndsLine = describedOutputs.last?.endsLine ?? false
        if !lastDescriptionEndsLine { selectedController.endLine() }
        
    }
    
}

public typealias AppliedDescriptor = (descriptor: OutputDescriptor, valueIndices: [Int])

struct DefaultSTDIO {
    
    let outputType: Consler.OutputType
    
    private let nextLine = "\n"
    
    func writeError(_ value: String) {
        fputs(value, stderr)
        //print(value, to: &stderrStream)
    }
    
    func writeStandard(_ value: String) {
        print(value)
    }
    
    func output(descriptors: [OutputDescriptor] = [], values: [String]) {
        guard !values.isEmpty else { return }
        let descriptors = descriptors.matchCount(of: values)
        var nextLineCandidates = Array(descriptors.map { $0.endsLine }.dropLast())
        
        // Both writers alread terminate with next line
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
