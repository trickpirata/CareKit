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

/// A card that displays a header, grid of buttons, and a multi-line label In CareKit, this view is intended to display
/// multiple events for a particular task. The state of each button in the grid indicates the completion state of the
/// corresponding event.
///
///
///     +-------------------------------------------------------+
///     |                                                       |
///     |  [title]                               [detail        |
///     |  [detail]                              disclosure]    |
///     |                                                       |
///     |                                                       |
///     |  --------------------------------------------------   |
///     |     o o      o o      o o                     o o     |
///     |    o   o    o   o    o   o        ...        o   o    |
///     |     o o      o o      o o                     o o     |
///     |                                                       |
///     |   [instructions]                                      |
///     +-------------------------------------------------------+
///

struct GridTaskView: View {
    // MARK: - Properties
    @Environment(\.careKitStyle) private var style
    
    let title: Text
    let detail: Text?
    let instructions: Text?
    let detailDisclosureImage: Image?
    let divider: Divider?
    
    
    var body: some View {
        CardView {
            HStack {
                HeaderView(title: title, detail: detail, image: nil, disclosureImage: detailDisclosureImage, divider: divider)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 15) {
                    ForEach(0..<3) { _ in
                        CheckmarkButton(isChecked: false, borderWidth: 0.95, action: nil).frame(width: 50, height: 50, alignment: .center)
                            .scaledToFit()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            instructions?
                .font(Font.caption)
                .fontWeight(.regular)
                .foregroundColor(Color(style.color.secondaryLabel))
        }
    }
}

#if DEBUG
struct GridTaskView_Previews: PreviewProvider {
    static var previews: some View {
        GridTaskView(title: Text("Doxylamine"), detail: Text("3 remaining"), instructions: Text("Take the tablet with a full glass of water."), detailDisclosureImage: Image(systemName: "chevron.right"), divider: Divider())
    }
}
#endif
