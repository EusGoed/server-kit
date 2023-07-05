//
// Copyright © 2023 Eus Goed.
// All Rights Reserved.

import Vapor
extension Abort {
    init(_ status: HTTPResponseStatus, withError reason: String, underlyingError error: Error? = nil) {
        logError("\(reason.errorMessage()) \(error != nil ? "underlying error: \(error?.localizedDescription ?? "")" : "")")
        self.init(status, reason: reason.errorMessage())
    }
}
