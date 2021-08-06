//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation
import Int2X

public protocol IdlType: IdlEnumFieldConvertible {}

extension Bool: IdlType{}
extension UInt8: IdlType{}
extension Int8: IdlType{}
extension UInt16: IdlType{}
extension Int16: IdlType{}
extension UInt32: IdlType{}
extension Int32: IdlType{}
extension UInt64: IdlType{}
extension Int64: IdlType{}
extension UInt2X: IdlEnumFieldConvertible {}

//extension Array: IdlType where Element == UInt8 {}
extension String: IdlType{}

public struct IdlTypeVec: IdlType {
    let vec: IdlType
}

public struct IdlTypeOption: IdlType {
    let option: IdlType
}

// User defined type.
public struct IdlTypeDefined: IdlType {
    let defined: String
}

public struct IdlEnumVariant {
    let name: String
    let fields: IdlEnumFields?
}
