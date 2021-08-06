//
//  File.swift
//  
//
//  Created by Chung Tran on 06/08/2021.
//

import Foundation
import PromiseKit
import BufferLayoutSwift

public struct Idl {
    let version: String
    let name: String
    let instructions: [IdlInstruction]
    let state: IdlState?
    let accounts: [IdlTypeDef]?
    let types: [IdlTypeDef]?
    let events: [IdlEvent]?
    let errors: [IdlErrorCode]?
}

public struct IdlEvent {
    let name: String
    let fields: [IdlEventField]
}

public struct IdlEventField {
    let name: String
    let type: IdlType
    let index: Bool
}

public struct IdlInstruction {
    let name: String
    let accounts: [IdlAccountItem]
    let args: [IdlField]
}

public struct IdlState {
    let `struct`: IdlTypeDef
    let methods: [IdlStateMethod]
}

typealias IdlStateMethod = IdlInstruction

public struct IdlField {
    let name: String
    let type: IdlType
}

public struct IdlTypeDef {
    let name: String
    let type: IdlTypeDefTy
}

struct IdlTypeDefTy {
    enum Kind: String {
        case `struct`, `enum`
    }
    let kind: Kind
    let fields: IdlTypeDefStruct?
    let variants: [IdlEnumVariant]
}

typealias IdlTypeDefStruct = [IdlField]

extension Idl {
    ///  Deterministic IDL address as a function of the program id.
    /// - Parameter programId: programId
    /// - Returns: a PublicKey
    public static func idlAddress<T: PublicKey>(programId: T) -> Promise<T> {
//        const base = (await PublicKey.findProgramAddress([], programId))[0]
        return firstly {
            T.findProgramAddress(from: programId)
        }
        .then {base in
            T.createWithSeed(base: base, seed: Self.seed, programId: programId)
        }
    }
    
    ///  Seed for generating the idlAddress.
    public static var seed: String {
        "anchor:idl"
    }
    
//    static func decodeIdlAccount<T: IdlProgramAccount>(data: Data) -> T {
//        T(buffer: data)
//    }
//
//    export function encodeIdlAccount(acc: IdlProgramAccount): Buffer {
//    const buffer = Buffer.alloc(1000) // TODO: use a tighter buffer.
//    const len = IDL_ACCOUNT_LAYOUT.encode(acc, buffer)
//    return buffer.slice(0, len)
//    }
}

///  The on-chain account of the IDL.
public protocol IdlProgramAccountType: BufferLayout {
    associatedtype T: PublicKey
    var authority: T {get}
    var data: Int {get}
}

