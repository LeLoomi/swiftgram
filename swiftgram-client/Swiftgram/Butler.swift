//
//  Butler.swift
//  Swiftgram
//
//  Created by Eliah Lohr on 02.11.22.
//
//  This class is a servie class. It hold "miscellaneous" functionality like numbers formatting etc.

import Foundation

struct Butler {
    // Our user default save functions
    public func saveSetting(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    public func saveSetting(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    public func saveSetting(key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    // our number formatter functions to give us our metric, shortened counts
    public func formatMetricUInt(number: UInt32) -> String {
        switch number {
        case _ where number <= 999:
            return String(number)

        case _ where number >= 1000 && number <= 999_999:
            var temp = String(String(number).dropLast(2))

            if temp[temp.index(temp.endIndex, offsetBy: -1)] != Character("0") {
                temp = String(String(number).dropLast(2))
                let i = temp.index(temp.endIndex, offsetBy: -1)
                temp.insert(".", at: i)
            } else {
                temp = String(String(number).dropLast(3))
            }

            temp = temp + "K"
            return temp

        case _ where number >= 1_100_000:
            var temp = String(String(number).dropLast(5))

            if temp[temp.index(temp.endIndex, offsetBy: -1)] != Character("0") {
                temp = String(String(number).dropLast(5))
                let i = temp.index(temp.endIndex, offsetBy: -1)
                temp.insert(".", at: i)
            } else {
                temp = String(String(number).dropLast(6))
            }

            temp = temp + "M"
            return temp

        default:
            return "error"
        }
    }

    public func formatMetricUInt(number: UInt16) -> String {
        return formatMetricUInt(number: UInt32(number))
    }

    public func formatMetricUInt(number: UInt8) -> String {
        return formatMetricUInt(number: UInt32(number))
    }
}
