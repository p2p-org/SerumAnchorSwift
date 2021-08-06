//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation
import BufferLayoutSwift

///  The on-chain account of the IDL.
public protocol IdlProgramAccountType: BufferLayout {
    associatedtype T: PublicKeyType
    var authority: T {get}
    var data: VecU8 {get}
}
