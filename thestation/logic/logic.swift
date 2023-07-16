//
//  logic.swift
//  thestation
//
//  Created by Paul Crews on 7/14/23.
//

import Foundation
import SwiftUI

public func gridColumns(cols: Int) -> [GridItem]{
    
    var columns : [GridItem] = []
    
    for _ in 0...cols{
        columns.append(GridItem(.flexible()))
    }
    
    return columns
}
