//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation
import PromiseKit
import BufferLayoutSwift

public protocol PublicKeyType: IdlType, BufferLayoutProperty {
    static func findProgramAddress(from programId: Self) -> Promise<Data>
    static func createWithSeed(base: Data, seed: String, programId: Self) -> Promise<Self>
}
