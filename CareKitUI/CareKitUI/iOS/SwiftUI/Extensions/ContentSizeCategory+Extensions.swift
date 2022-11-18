//
/*
 Copyright (c) 2020, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3. Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public enum ContentSizeCategory : Hashable, CaseIterable {
//
//    case extraSmall
//
//    case small
//
//    case medium
//
//    case large
//
//    case extraLarge
//
//    case extraExtraLarge
//
//    case extraExtraExtraLarge
//
//    case accessibilityMedium
//
//    case accessibilityLarge
//
//    case accessibilityExtraLarge
//
//    case accessibilityExtraExtraLarge
//
//    case accessibilityExtraExtraExtraLarge
//
//    /// The hash value.
//    ///
//    /// Hash values are not guaranteed to be equal across different executions of
//    /// your program. Do not save hash values to use during a future execution.
//    ///
//    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
//    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
//    public var hashValue: Int { get }
//
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher)
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (a: ContentSizeCategory, b: ContentSizeCategory) -> Bool
//
//    /// A type that can represent a collection of all values of this type.
//    public typealias AllCases = [ContentSizeCategory]
//
//    /// A collection of all values of this type.
//    public static var allCases: [ContentSizeCategory] { get }
//}
import Foundation
import SwiftUI

extension ContentSizeCategory {
    public static func < (left: ContentSizeCategory, right: ContentSizeCategory) -> Bool {
        return Self.allCases.firstIndex(of: left)! < Self.allCases.firstIndex(of: right)!
    }
    
    public static func <= (left: ContentSizeCategory, right: ContentSizeCategory) -> Bool {
        return Self.allCases.firstIndex(of: left)! <= Self.allCases.firstIndex(of: right)!
    }
    
    public static func > (left: ContentSizeCategory, right: ContentSizeCategory) -> Bool {
        return Self.allCases.firstIndex(of: left)! > Self.allCases.firstIndex(of: right)!
    }
    
    public static func >= (left: ContentSizeCategory, right: ContentSizeCategory) -> Bool {
        return Self.allCases.firstIndex(of: left)! >= Self.allCases.firstIndex(of: right)!
    }
}
