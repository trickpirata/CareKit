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

import SwiftUI

/// A card that displays information for a contact.
///
/// # Style
/// The card supports styling using `careKitStyle(_:)`.
///
///
/// A card that displays information for a contact. The header is an `OCKHeaderView`.
///
///     +-------------------------------------------------------+
///     | +------+                                              |
///     | | icon | [title]                       [detail        |
///     | | img  | [detail]                       disclosure]   |
///     | +------+                                              |
///     +-------------------------------------------------------+
///
public struct SimpleContactView<Header: View>: View {

    // MARK: - Properties

    @Environment(\.careKitStyle) private var style

    private let header: Header

    public var body: some View {
        CardView {
            VStack {
                header
            }
        }
    }

    // MARK: - Init

    /// Create an instance.
    /// - Parameter header: Header to inject at the top of the card. Specified content will be stacked vertically.
    /// - Parameter footer: View to inject under the instructions. Specified content will be stacked vertically.
    public init(@ViewBuilder header: () -> Header) {
        self.header = header()
    }
}

public extension SimpleContactView where Header == HeaderView {

    /// Create an instance.
    /// - Parameter title: Title text to display in the header.
    /// - Parameter detail: Detail text to display in the header.
    /// - Parameter instructions: Instructions text to display under the header.
    /// - Parameter footer: View to inject under the instructions. Specified content will be stacked vertically.
    init(title: Text, detail: Text?) {
        self.init(header: {
            Header(title: title, detail: detail)
        })
    }
}

public extension SimpleContactView {

    /// Create an instance.
    /// - Parameter isComplete: True if the button under the instructions is in the completed.
    /// - Parameter instructions: Instructions text to display under the header.
    /// - Parameter action: Action to perform when the button is tapped.
    /// - Parameter header: Header to inject at the top of the card. Specified content will be stacked vertically.
    init(isComplete: Bool, action: (() -> Void)?, @ViewBuilder header: () -> Header) {
        self.init(header: header)
    }
}

public extension SimpleContactView where Header == HeaderView {

    /// Create an instance.
    /// - Parameter title: Title text to display in the header.
    /// - Parameter detail: Detail text to display in the header.
    /// - Parameter instructions: Instructions text to display under the header.
    /// - Parameter isComplete: True if the button under the instructions is in the completed state.
    /// - Parameter action: Action to perform when the button is tapped.
    init(title: Text, detail: Text?, isComplete: Bool, action: (() -> Void)?) {
        self.init(header: {
            Header(title: title, detail: detail)
        })
    }
}

#if DEBUG
struct SimpleContactView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleContactView(header: {
             HeaderView(title: Text(verbatim: "Title"),
                        detail: Text(verbatim: "Subtitle"),
                        image: Image(systemName: "person.crop.circle"),
                        disclosureImage: Image(systemName: "chevron.right"),
                        divider: nil)
        })
        .environment(\.colorScheme, .dark)
    }
}
#endif
