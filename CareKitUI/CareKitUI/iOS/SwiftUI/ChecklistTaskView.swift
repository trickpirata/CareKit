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

/// A card that displays a vertically stacked checklist of items. In CareKit, this view is intended to display
/// multiple events for a particular task.
///
///     +-------------------------------------------------------+
///     | +------+                                              |
///     | | icon | [title]                       [detail        |
///     | | img  | [detail]                       disclosure]   |
///     | +------+                                              |
///     |                                                       |
///     |  --------------------------------------------------   |
///     |                                                       |
///     |  +-------------------------------------------------+  |
///     |  | [title]                                   [img] |  |
///     |  +-------------------------------------------------+  |
///     |  +-------------------------------------------------+  |
///     |  | [title]                                   [img] |  |
///     |  +-------------------------------------------------+  |
///     |                         .                             |
///     |                         .                             |
///     |                         .                             |
///     |  +-------------------------------------------------+  |
///     |  | [title]                                   [img] |  |
///     |  +-------------------------------------------------+  |
///     |                                                       |
///     |  [instructions]                                       |
///     +-------------------------------------------------------+
///

struct ChecklistTaskView: View {
    // MARK: - Properties
    @Environment(\.careKitStyle) private var style
    @State private var items = [ChecklistItemButton]()
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
            VStack(alignment: .leading, spacing: CGFloat(10.0)) {
                ForEach(0..<items.count) { idx in
                    self.items[idx]
                    Divider()
                }
            }
            
            instructions?
                .font(Font.caption)
                .fontWeight(.regular)
                .foregroundColor(Color(style.color.secondaryLabel))
        }
    }
    
    func updateItem(at index: Int,withTitle title: String) {
        guard index < items.count else { return }
        let button = items[index]
        button.title = title
    }
    
    func insertItem(withTitle title: String, at index: Int) {
        guard index < items.count else { return }
        items.insert(ChecklistItemButton(title: title), at: index)
    }
    
    func addItem(withTitle title: String) {
        items.append(ChecklistItemButton(title: title))
    }
    
    func removeItem(at index: Int) {
        guard index < items.count else { return }
        items.remove(at: index)
    }
    
    func clearItems() {
        items.removeAll()
    }
}

#if DEBUG
struct ChecklistTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let task = ChecklistTaskView(title: Text("Doxylamine"), detail: Text("2 remaining"), instructions: Text("Take the tablet with a full glass of water."), detailDisclosureImage: Image(systemName: "chevron.right"), divider: Divider())
        
        task.addItem(withTitle: "Yikes")
        task.addItem(withTitle: "Yikes")
        task.addItem(withTitle: "Yikes")
        task.addItem(withTitle: "Yikes")
        
        return task
    }
}
#endif
