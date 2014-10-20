//
//  Block.swift
//  Swiftris
//
//  Created by Neo on 20/10/14.
//  Copyright (c) 2014 Neo. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, Printable {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow

    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }

    var description: String {
        return self.spriteName
    }

    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}


// Hashable allows Block to be stored in Array2D
class Block: Hashable, Printable {

    // Constants
    // let is like "final"
    let color: BlockColor

    // Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?

    var spriteName: String {
        return color.spriteName
    }

    var hashValue: Int {
        // XOR is used to emphasize on the perfect indifference of 
        // the column / row.
        return self.column ^ self.row
    }

    var description: String {
        return "\(color): [\(column), \(row)]"
    }

    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }


}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}



