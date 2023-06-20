//
//  PIDController.swift
//  SmartLodging
//
//  Created by Fabian Hofer on 18.03.23.
//

import Foundation

class PIDController {
    private var kp: Double
    private var ki: Double
    private var kd: Double
    private var integral: Double
    private var previousError: Double
    
    
    
    init(kp: Double, ki: Double, kd: Double) {
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.integral = 0
        self.previousError = 0
    }
    
    func calculate(error: Double) -> Double {
        let proportional = kp * error
        integral += ki * error //TODO
        let derivative = kd * (error - previousError)
        previousError = error // TODO
        return proportional + integral + derivative
    }
    
}
