//
//  Butler.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 02.11.22.
//
//  This file provides service functionality. It hold "miscellaneous" stuff like numbers formatting etc.

import Foundation

// We extend Int etc to make the functionality available without butler instances
// make available to SingedInteger / Int type instead of just UnsignedInt?
extension UnsignedInteger {
    func formatSGMetric() -> String {
        
        let input = UInt64(self)  // To make our formatter compatible we have to wrap it in a big enough "actual" int
        
        switch input {
        case _ where input <= 999:
            return String(input)

        case _ where input >= 1000 && input <= 999_999:
            var temp = String(String(input).dropLast(2))

            if temp[temp.index(temp.endIndex, offsetBy: -1)] != Character("0") {
                temp = String(String(input).dropLast(2))
                let i = temp.index(temp.endIndex, offsetBy: -1)
                temp.insert(".", at: i)
            } else {
                temp = String(String(input).dropLast(3))
            }

            temp = temp + "K"
            return temp

        case _ where input >= 1_100_000:
            var temp = String(String(input).dropLast(5))

            if temp[temp.index(temp.endIndex, offsetBy: -1)] != Character("0") {
                temp = String(String(input).dropLast(5))
                let i = temp.index(temp.endIndex, offsetBy: -1)
                temp.insert(".", at: i)
            } else {
                temp = String(String(input).dropLast(6))
            }

            temp = temp + "M"
            return temp

        default:
            return "format error"
        }
    }
}

extension String {
    public func saveInUserDefaults(key:String) {
        //UserDefaults.standard.set(self, forKey: key)
    }
}

extension Int {
    public func saveInUserDefaults(key:String) {
        //UserDefaults.standard.set(self, forKey: key)
    }
}

extension Bool {
    public func saveInUserDefaults(key:String) {
        //UserDefaults.standard.set(self, forKey: key)
    }
}
