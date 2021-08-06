//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation

protocol IdlAccountItem {
    var name: String {get}
}
public struct IdlAccount: IdlAccountItem {
    let name: String
    let isMut: Bool
    let isSigner: Bool
}

// A nested/recursive version of IdlAccount.
public struct IdlAccounts {
    let name: String
    let accounts: [IdlAccountItem]
}
