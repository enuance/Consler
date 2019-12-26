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
    
    static private var standardOut: TerminalController? {
        TerminalController(stream: stdoutStream)
    }
    
    static private var standardErr: TerminalController? {
        TerminalController(stream: stderrStream)
    }
    
    /// The output type that the Consler should write to
    public enum OutputType {
        case standard
        case error
    }
    
    /// Formats the rawValue using the OutputDescriptor and the TerminalController
    /// The outputValue property should contain fully formatted String ready for terminal output
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
    
    static public func output(_ values: [String], descriptors: [OutputDescriptor] = [], type: OutputType = .standard) {
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
    
    /// Warning: Not yet defaulted by DefaultSTDIO. Will not output in non-TTY contexts
    static public func output(_ values: [String], appliedDescriptors: [AppliedDescriptor], type: OutputType = .standard) {
        let controller = type == .standard ? Consler.standardOut : Consler.standardErr
        guard let selectedController = controller, !values.isEmpty, !appliedDescriptors.isEmpty else {
            DefaultSTDIO(outputType: type).output(appliedDescriptors: appliedDescriptors, values: values)
            return
        }
        let validIndexRange = values.startIndex..<values.endIndex
        
        let validatedAppDescriptors = appliedDescriptors.map { appDescriptor -> AppliedDescriptor in
            let validIndices = appDescriptor.applicationIndices.filter { validIndexRange.contains($0) }
            return AppliedDescriptor(descriptor: appDescriptor.descriptor, applicationIndices: validIndices)
        }
        
        var descriptors = [OutputDescriptor]().matchCount(of: values)
        
        validatedAppDescriptors.forEach { appDescriptor in
            appDescriptor.applicationIndices.forEach { descriptors[$0] = appDescriptor.descriptor }
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

public extension Consler {
    
    static func output(_ values: String..., descriptors: [OutputDescriptor] = [], type: OutputType = .standard) {
        output(values, descriptors: descriptors, type: type)
    }
    
    static func output(_ value: String, descriptor: OutputDescriptor = .normal, type: OutputType = .standard) {
        output([value], descriptors: [descriptor], type: type)
    }
    
    static func output(_ values: String..., appliedDescriptors: [AppliedDescriptor], type: OutputType = .standard) {
        output(values, appliedDescriptors: appliedDescriptors, type: type)
    }
    
    static func output(_ conslerOutput: ConslerOutput, type: OutputType = .standard) {
        switch conslerOutput.type {
        case .normal:
            output(conslerOutput.values, descriptors: conslerOutput.descriptors, type: type)
        case .applied:
            output(conslerOutput.values, appliedDescriptors: conslerOutput.appliedDescriptors, type: type)
        }
    }
    
}
