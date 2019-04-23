//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static public func drawYellowDot(at point: MyPoint) {
        let yellowDot = ANSICode.text.yellowBright + ANSICode.dot
        let pointRow = ANSICode.axis.AxisLimit - point.y + 1
        let pointCol = point.x * 2 + 3
        let directionToDraw = ANSICode.cursor.move(row: pointRow, col: pointCol) + yellowDot
        
        print(directionToDraw)
        moveCursorToOrigin()
    }
    
    static func moveCursorToOrigin() {
        let moveToOrigin = ANSICode.cursor.move(row: ANSICode.axis.originRow, col: ANSICode.axis.originCol)
        print(moveToOrigin)
    }
}

