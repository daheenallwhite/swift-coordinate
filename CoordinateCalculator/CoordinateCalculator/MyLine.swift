//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private var pointA: MyPoint
    private var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}

extension MyLine: AxisDrawable {
    var points: [MyPoint] {
        return [pointA, pointB]
    }
}

extension MyLine: ValueComputable {
    var descriptionOfComputedValue: String {
        return "두 점 사이의 거리는 "
    }
    
    func getComputedValue() -> Double {
        return computeLength()
    }
    
    private func computeLength() -> Double {
        let distanceX = pow(Double(pointA.x - pointB.x), 2.0)
        let distanceY = pow(Double(pointA.y - pointB.y), 2.0)
        return sqrt(distanceX + distanceY)
    }
}


