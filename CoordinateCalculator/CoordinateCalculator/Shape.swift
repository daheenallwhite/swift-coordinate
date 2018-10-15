//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 13/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    var points: [MyPoint] { get }
}

protocol CalculableShape: Shape {
    var calculationMessage: String { get }
    func calculate() -> Double
}

struct ShapeGenerator {
    static func generatePoint(from coordinate: String) -> MyPoint? {
        let textValidator = TextValidator(text: coordinate)
        guard textValidator.hasNoInvalidCharacter() else {
            OutputView.printMessageOfTextInvalidation()
            return nil
        }
        let coordinatesValidation = textValidator.checkTextError()
        guard coordinatesValidation == .success else {
            OutputView.printMessage(of: coordinatesValidation)
            return nil
        }
        let point = TextProcessor.extractPoint(from: coordinate)
        return MyPoint(x: point.x, y: point.y)
    }
    
    private static func calculateDistance(between pointA: MyPoint, and pointB: MyPoint) -> Double {
        return sqrt(pow(Double(pointA.x-pointB.x), 2) + pow(Double(pointA.y-pointB.y), 2))
    }
    
    private static func satisfyTriangleInequality(of points: [MyPoint]) -> Bool {
        var sideLengths = [Double]()
        sideLengths.append(calculateDistance(between: points[0], and: points[1]))
        sideLengths.append(calculateDistance(between: points[1], and: points[2]))
        sideLengths.append(calculateDistance(between: points[0], and: points[2]))
        sideLengths.sort()
        return sideLengths[0] + sideLengths[1] > sideLengths[2]
    }
    
    static func generateShape(by points: [MyPoint]) -> Shape? {
        switch points.count {
        case 1:
            return points[0]
        case 2:
            return MyLine(pointA: points[0], pointB: points[1])
        case 3:
            guard satisfyTriangleInequality(of: points) else { return nil }
            return MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        default:
            return nil
        }
    }
}