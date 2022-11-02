//
//  Butler.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 02.11.22.
//
//  This class is a servie class. It hold "miscellaneous" functionality like numbers formatting etc.

import Foundation

struct Butler {
    
    //our number formatter functions to give us
    public func formatUInt32 (number: UInt32) -> String {
        switch number {
            case _ where number <= 999:
                return String(number)
                
            case _ where 1000 <= number && number <= 999_999:
                var temp = String(String(number).dropLast(3))
                temp = temp + "K"
                return temp
                
            case _ where 999_999 < number:
                var temp = String(String(number).dropLast(6))
                temp = temp + "M"
                return temp
                
            default:
                return "error"
        }
    }
    
    public func formatUInt16 (number: UInt16) -> String {
        return formatUInt32(number: UInt32(number))
    }
    
    public func formatUInt16 (number: UInt8) -> String {
        return formatUInt32(number: UInt32(number))
    }
}
