//
// Copyright © 2023 Eus Goed.
// All Rights Reserved.


import Foundation
import FluentKit
import Vapor

extension Optional {
    func unwrap(or abort: Abort) throws -> WrappedType {
        guard let value = self else { throw abort }
        return value
    }
}
