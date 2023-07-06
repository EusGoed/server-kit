//
// Copyright © 2023 Eus Goed.
// All Rights Reserved.

import Vapor
public extension Abort {
    init(_ status: HTTPResponseStatus, withError reason: String, underlyingError error: Error? = nil) {
        let text = "\(error != nil ? "underlying error: \(error?.localizedDescription ?? "")" : "")"
        logError(text)
        self.init(status, reason: text)
    }
}
