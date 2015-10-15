//
//  TSNAtomicBool.swift
//  TSNAtomicBool
//
//  Created by Brian Lambert on 10/14/15.
//

import Foundation

/// TSNAtomicBool class.
public class TSNAtomicBool
{
    // The value of the atomic bool. Will be either 0 or 1.
    private var value : Int32
    
    // Initialize to an initial value.
    init(_ initialValue : Bool = false)
    {
        // There is no need to use an atomic operation for initialization.
        value = initialValue ? 1 : 0
    }
    
    // Tries to set the TSNAtomicBool to true. Returns true, if the TSNAtomicBool was successfully set to true; otherwise, false.
    public func trySetTrue() -> Bool
    {
        return OSAtomicCompareAndSwap32Barrier(0, 1, &value)
    }
    
    // Tries to set the TSNAtomicBool to false. Returns true, if the TSNAtomicBool was successfully set to false; otherwise, false.
    public func trySetFalse() -> Bool
    {
        return OSAtomicCompareAndSwap32Barrier(1, 0, &value)
    }
}

// Implementation of the BooleanType protocol for TSNAtomicBool.
extension TSNAtomicBool : BooleanType
{
    /// The value of `self`, expressed as a `Bool`.
    public var boolValue: Bool
    {
        return OSAtomicCompareAndSwap32Barrier(1, 1, &value)
    }
}

// Operator overload for TSNAtomicBool == BooleanType.
public func == (left: TSNAtomicBool, right: BooleanType) -> Bool
{
    return left.boolValue == right.boolValue
}

// Operator overload for BooleanType == TSNAtomicBool.
public func == (left: BooleanType, right: TSNAtomicBool) -> Bool
{
    return left.boolValue == right.boolValue
}

// Operator overload for TSNAtomicBool != BooleanType.
public func != (left: TSNAtomicBool, right: BooleanType) -> Bool
{
    return left.boolValue != right.boolValue
}

// Operator overload for BooleanType != TSNAtomicBool.
public func != (left: BooleanType, right: TSNAtomicBool) -> Bool
{
    return left.boolValue != right.boolValue
}
