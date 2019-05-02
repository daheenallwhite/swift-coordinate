//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    
    var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    init(pairA: Pair, pairB: Pair, pairC: Pair) {
        let pointA = MyPoint(x: pairA.x, y: pairA.y)
        let pointB = MyPoint(x: pairB.x, y: pairB.y)
        let pointC = MyPoint(x: pairC.x, y: pairC.y)
        self.init(pointA: pointA, pointB: pointB, pointC: pointC)
    }
}

extension MyTriangle: AxisDrawable {
    var points: [MyPoint] {
        var points = lineAB.points
        points.append(lineAC.pointB)
        return points
    }
}

extension MyTriangle: ValueComputable {
    var description: String {
        return "삼각형의 넓이는 "
    }
    
    func getComputedValue() -> Double {
        let a = lineBC.getComputedValue()
        let b = lineAC.getComputedValue()
        let c = lineAB.getComputedValue()
        let cosB = (pow(a, 2)+pow(c, 2)-pow(b, 2)) / 2.0 * a * c
        let sinB = sqrt(1-pow(cosB, 2))
        let area = 0.5 * a * c * sinB
        return area
    }
}
