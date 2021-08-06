//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation

protocol IdlEnumFields {}

typealias IdlEnumFieldsNamed = [IdlField]
typealias IdlEnumFieldsTuple = [IdlType]

public protocol IdlEnumFieldConvertible {}
extension IdlField: IdlEnumFieldConvertible {}

extension Array: IdlEnumFields where Element: IdlEnumFieldConvertible {}


