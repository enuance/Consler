//
//  File.swift
//  
//
//  Created by Stephen Martinez on 12/24/19.
//

import Foundation

struct StderrOutputStream: TextOutputStream {
    mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

struct DefaultSTDIO {
    
    let outputType: Consler.OutputType
    
    private let nextLine = "\n"
    
    func writeError(_ value: String) {
        var standardError = StderrOutputStream()
        print(value, to: &standardError)
    }
    
    func writeStandard(_ value: String) {
        print(value)
    }
    
    func output(descriptors: [OutputDescriptor] = [], values: [String]) {
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
    
}
