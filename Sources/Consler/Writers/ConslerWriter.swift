//
//  ConslerWriter.swift
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

import Basic
import Foundation

/// Wrapper for the TerminalController to enable extended colors and formats
internal struct ConslerWriter {

    /// Pointer to output stream to operate on.
    private var stream: OutputByteStream

    /// Width of the terminal.
    internal let width: Int

    private var clearLn: String { EscapedTranslation.clearLine.translated }
    
    private var reset: String { EscapedTranslation.reset.translated }
    
    /// Constructs the instance if the stream is a tty.
    internal init?(stream: OutputByteStream) {
        let realStream = (stream as? ThreadSafeOutputByteStream)?.stream ?? stream

        // Make sure it is a file stream and it is tty.
        guard
            let fileStream = realStream as? LocalFileOutputByteStream,
            TerminalController.isTTY(fileStream)
            else { return nil }

        // Determine the terminal width otherwise assume a default.
        if let terminalWidth = TerminalController.terminalWidth(), terminalWidth > 0 {
            width = terminalWidth
        } else {
            width = 80
        }
        self.stream = stream
    }

    /// Flushes the stream.
    internal func flush() {
        stream.flush()
    }

    /// Clears the current line and moves the cursor to beginning of the line..
    internal func clearLine() {
        stream <<< clearLn <<< "\r"
        flush()
    }

    /// Inserts a new line character into the stream.
    internal func endLine() {
        stream <<< "\n"
        flush()
    }
    
    private func writeWrapped(
        _ value: String,
        textColor: TextColor,
        backgroundColor: BackgroundColor,
        formats: Set<TextFormat>,
        stream: OutputByteStream
    ) {
        
        guard !value.isEmpty && !formats.isEmpty else { stream <<< value; return }
        
        let rawTextColor = textColor.translated
        let rawBackgroundColor = backgroundColor.translated
        let rawFormats = formats.map { $0.translated }
        let streamArguments = [rawTextColor, rawBackgroundColor] + rawFormats + [value, reset]
        _ = streamArguments.reduce(stream, <<<)
        
    }
    
    internal func description(
        for value: String,
        color: TextColor = .normal,
        background: BackgroundColor = .normal,
        formats: Set<TextFormat> = []
    ) -> String {
        
        let describingStream = BufferedOutputByteStream()
        
        writeWrapped(value,
                     textColor: color,
                     backgroundColor: background,
                     formats: formats,
                     stream: describingStream)
        
        return describingStream.bytes.description
    }
    
    internal func write(_ rawValue: String) {
        stream <<< rawValue <<< reset
        flush()
    }
    
}
