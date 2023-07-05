//
// Copyright © 2023 Eus Goed.
// All Rights Reserved

import Foundation
import Vapor
import LoggingExt
import Logging

public struct CustomLogHandler: Logging.LogHandler {
    public typealias Logger = Logging.Logger
    
    public var metadata: Logger.Metadata = [:]
    public var logLevel: Logger.Level = .info
    
    public var showDate: Bool = false
    
    public init(logLevel: String) {
        self.logLevel = .init(rawValue: logLevel) ?? .info
    }
    
    public init(logLevel: Logger.Level) {
        self.logLevel = logLevel
    }
    
    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, source: String, file: String, function: String, line: UInt) {
        guard level >= logLevel else {
            return
        }
        
        guard message != "GET /" else { return }
        
        var mergedMetadata = self.metadata
        metadata?.forEach { mergedMetadata[$0] = $1 }
        
        // Perform logging operations here
        let stream = StdioOutputStream.stdout
        switch logLevel {
        case .info, .debug, .notice, .trace, .warning:
            stream.write("[\(level.rawValue.uppercased())] \(level.icon ?? "")\(message)\n")
        case .critical, .error:
            stream.write("[\(level.rawValue.uppercased())] \(level.icon ?? "")\(file):\(function):\(line) - \(message)\n")
        }
    }
    
    public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
        get {
            return metadata[metadataKey]
        }
        set {
            metadata[metadataKey] = newValue
        }
    }
}
extension Logging.Logger.Level {
    var icon: String? {
        switch self {
        case .info:
            return "ℹ️ "
        case .error:
            return "❌ "
        case .warning:
            return "⚠️ "
        case .critical:
            return "🆘 "
        case .notice:
            return "🤖 "
        default:
            return nil
        }
    }
}
