//
// Copyright © 2023 Eus Goed.
// All Rights Reserved.

import Foundation
import Vapor
import Queues

extension Application.Queues {
    func scheduleEvery(_ job: ScheduledJob, minutes: Int) {
        for minuteOffset in stride(from: 0, to: 60, by: minutes) {
            schedule(job).hourly().at(.init(integerLiteral: minuteOffset))
        }
    }
    
    func scheduleEvery(_ job: ScheduledJob, hours: Int, minute: Int) {
        for hour in stride(from: 0, to: 24, by: hours) {
            schedule(job).daily().at(.init(stringLiteral: "\(hour):\(minute)"))
        }
    }
}
