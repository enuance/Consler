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

import var Basic.stdoutStream
import var Basic.stderrStream
import Foundation

/// Consler provides convenient access to input and output to the console. Notabley, the output functions provide an easy way to format
/// your console output with various colors and weights.
///
public struct Consler {
    
    static private var standardOut: ConslerWriter? {
        ConslerWriter(stream: stdoutStream)
    }
    
    static private var standardErr: ConslerWriter? {
        ConslerWriter(stream: stderrStream)
    }
    
    /// The output type that the Consler should write to
    public enum OutputType {
        case standard
        case error
    }
    
    /// Formats the rawValue using the OutputDescriptor and the TerminalController
    /// The outputValue property should contain a fully formatted String ready for terminal output
    private struct DescribedOutput {
        let outputValue: String
        let endsLine: Bool
        
        private init(outputValue: String, endsLine: Bool) {
            self.outputValue = outputValue
            self.endsLine = endsLine
        }
        
        init(_ rawValue: String, descriptor: OutputDescriptor = .normal, writer: ConslerWriter) {
            let newOutputValue = writer.description(
                for: rawValue,
                color: descriptor.textColor,
                background: descriptor.backgroundColor,
                formats: descriptor.formats
            )
            self.init(outputValue: newOutputValue, endsLine: descriptor.endsLine)
        }
        
    }
    
    static public func input(acceptsNonBlankOnly: Bool = true) -> String? {
        guard let consoleInput = readLine() else { return nil }
        if acceptsNonBlankOnly && consoleInput.isBlank { return nil }
        return consoleInput
    }
    
    /// Output values to the Console
    ///
    /// The order of the descriptors should match the values that they are intended to describe. If descriptors are not provided for the
    /// values, they will be defaulted to `.normal`. If more descriptors are provided than values, then the excess will be dropped
    /// until the count matches the values. The last value provided will always end the line.
    ///
    /// - warning:
    ///  If the terminal type is anything other than a TTY (ie. a file stream), then the provided values will be outputed in a descriptor
    ///   agnostic, non-formatted manner that is compatible for those contexts.
    ///
    /// - parameters:
    ///     - values: An array of Strings to be outputted to the console
    ///     - descriptors: An array of output descriptors that describe how the values should be formatted on the Console
    ///     - type: The Console output type
    ///
    static public func output(_ values: [String], descriptors: [OutputDescriptor] = [], type: OutputType = .standard) {
        
        // Determine and set the chosen Console Writer Type and output type for the writer
        let writer = type == .standard ? Consler.standardOut : Consler.standardErr
        guard let selectedWriter = writer, !values.isEmpty else {
            DefaultWriter(outputType: type).output(values: values, descriptors: descriptors)
            return
        }
        
        // Fill out descriptors (defaulting to `.normal`) if short and drop excess if extra
        let descriptors = descriptors.matchCount(of: values)
        
        // Format each of the values as described by the associated descriptors.
        let describedOutputs = zip(values, descriptors)
            .map { DescribedOutput($0, descriptor: $1, writer: selectedWriter) }
        
        // Write out the formatted values and interject next lines where endLine descriptors were provided.
        describedOutputs.forEach { description in
            selectedWriter.write(description.outputValue)
            if description.endsLine { selectedWriter.endLine() }
        }
        
        // Terminate the write with a final next line
        let lastDescriptionEndsLine = describedOutputs.last?.endsLine ?? false
        if !lastDescriptionEndsLine { selectedWriter.endLine() }
    }
    
    /// Output values to the Console
    ///
    /// The indices provided to the `AppliedDescriptor`s are validated against the values provided. Invalid indices will be
    /// discarded. If an index is provided multiple times, the last descriptor provided to that index will override the others. Any value that
    /// does not have a descriptor assigned to it by the `AppliedDescriptor` will be defaulted to normal. The last value provided
    /// will always end the line.
    ///
    /// - warning:
    ///  If the terminal type is anything other than a TTY (ie. a file stream), then the provided values will be outputed in a descriptor
    ///   agnostic, non-formatted manner that is compatible for those contexts.
    ///
    /// - parameters:
    ///     - values: An array of Strings to be outputted to the console
    ///     - appliedDescriptors: An array of applied descriptors that describes which values and how those values should
    ///     be formatted on the Console
    ///     - type: The Console output type
    ///
    static public func output(_ values: [String], appliedDescriptors: [AppliedDescriptor], type: OutputType = .standard) {
        
        // Determine and set the chosen Console Writer Type and output type for the writer
        let writer = type == .standard ? Consler.standardOut : Consler.standardErr
        guard let selectedWriter = writer, !values.isEmpty, !appliedDescriptors.isEmpty else {
            DefaultWriter(outputType: type).output(values: values, appliedDescriptors: appliedDescriptors)
            return
        }
        
        // Create an Index validation range
        let validIndexRange = values.startIndex..<values.endIndex
        
        // Validate the indices provided in the AppliedDescriptors, returning safe AppliedDescriptors
        let validatedAppDescriptors = appliedDescriptors.map { appDescriptor -> AppliedDescriptor in
            let validIndices = appDescriptor.applicationIndices.filter { validIndexRange.contains($0) }
            return AppliedDescriptor(descriptor: appDescriptor.descriptor, applicationIndices: validIndices)
        }
        
        // Create an array of `.normal` descriptors matching the count of values.
        var descriptors = [OutputDescriptor]().matchCount(of: values)
        
        // Update the `descriptors` with any descriptors indexed from the array of `validatedAppDescriptors`
        validatedAppDescriptors.forEach { appDescriptor in
            appDescriptor.applicationIndices.forEach { descriptors[$0] = appDescriptor.descriptor }
        }
        
        // Format each of the values as described by the associated descriptors.
        let describedOutputs = zip(values, descriptors)
            .map { DescribedOutput($0, descriptor: $1, writer: selectedWriter) }
        
        // Write out the formatted values and interject next lines where endLine descriptors were provided.
        describedOutputs.forEach { description in
            selectedWriter.write(description.outputValue)
            if description.endsLine { selectedWriter.endLine() }
        }
        
        // Terminate the write with a final next line
        let lastDescriptionEndsLine = describedOutputs.last?.endsLine ?? false
        if !lastDescriptionEndsLine { selectedWriter.endLine() }
    }
    
}

public extension Consler {
    
    /// Output a value to the Console
    ///
    /// Convenience method for outputing a single value to the console.
    ///
    /// - parameters:
    ///     - value: A String to be outputted to the console
    ///     - descriptor: A descriptor that describes how the value should be formatted on the Console
    ///     - type: The Console output type
    ///
    static func output(_ value: String, descriptor: OutputDescriptor = .normal, type: OutputType = .standard) {
        output([value], descriptors: [descriptor], type: type)
    }
    
    /// Output values to the Console
    ///
    /// Convenience method for outputing values to the console.
    ///
    /// - parameters:
    ///     - values: An arbitrary amount of Strings to be outputted to the console
    ///     - descriptors: An array of output descriptors that describe how the values should be formatted on the Console
    ///     - type: The Console output type
    ///
    static func output(_ values: String..., descriptors: [OutputDescriptor] = [], type: OutputType = .standard) {
        output(values, descriptors: descriptors, type: type)
    }
    
    /// Output values to the Console
    ///
    /// Convenience method for outputing values to the console.
    ///
    /// - parameters:
    ///     - values: An arbitrary amount of Strings to be outputted to the console
    ///     - appliedDescriptors: An array of applied descriptors that describes which values and how those values should
    ///     be formatted on the Console
    ///     - type: The Console output type
    ///
    static func output(_ values: String..., appliedDescriptors: [AppliedDescriptor], type: OutputType = .standard) {
        output(values, appliedDescriptors: appliedDescriptors, type: type)
    }
    
    /// Output values to the Console
    ///
    /// Convenience method for outputing values to the console using the ConslerOutput type to encapsulate values and their
    /// associated descriptors.
    ///
    /// - parameters:
    ///     - conslerOutput: An arbitrary amount of Strings to be outputted to the console
    ///     - type: The Console output type
    ///
    static func output(_ conslerOutput: ConslerOutput, type: OutputType = .standard) {
        switch conslerOutput.type {
        case .normal:
            output(conslerOutput.values, descriptors: conslerOutput.descriptors, type: type)
        case .applied:
            output(conslerOutput.values, appliedDescriptors: conslerOutput.appliedDescriptors, type: type)
        }
    }
    
}
