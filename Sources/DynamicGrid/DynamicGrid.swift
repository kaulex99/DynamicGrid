//
//  DynamicGrid.swift
//  Dynamic
//
//  Created by Alexander Kauer on 15.12.22.
//

import Foundation
import SwiftUI

public struct DynamicGrid: Layout, Sendable {
    
    private let horizontalSpacing: CGFloat
    private let verticalSpacing: CGFloat
    
    public init(horizontalSpacing: CGFloat = 0, verticalSpacing: CGFloat = 0) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let containerWidth = proposal.replacingUnspecifiedDimensions().width
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        var maxYinRow: CGFloat?

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if (x + size.width) > containerWidth {
                x = 0
                y += maxYinRow ?? size.height
                y += verticalSpacing
                maxYinRow = 0
            }
            
            maxYinRow = max(maxYinRow ?? 0, size.height)
            x += size.width + horizontalSpacing
        }
        
        y += maxYinRow ?? 0
        
        return CGSize(width: containerWidth, height: y)
    }

    public func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        
        let subviewSizes = subviews.map { proxy in
            return proxy.sizeThatFits(.unspecified)
        }
        
        var x = bounds.minX
        var y: CGFloat = bounds.minY.isNaN ? 0 : bounds.minY
        
        var maxYinRow: CGFloat?

        for index in subviews.indices {
            let subviewSize = subviewSizes[index]
            let sizeProposal = ProposedViewSize(
                width: subviewSize.width,
                height: subviewSize.height)

            /// check if the next view exceeds the remaining space
            if (x + subviewSize.width) > bounds.maxX {
                x = bounds.minX
                y += maxYinRow ?? subviewSize.height
                y += verticalSpacing
                maxYinRow = 0
            }

            print("Will place item \(index) at x:\(x) y:\(y)")
            subviews[index]
                .place(
                    at: CGPoint(x: x, y: y),
                    anchor: .topLeading,
                    proposal: sizeProposal
                )

            maxYinRow = max(maxYinRow ?? 0, subviewSize.height)
            x += subviewSize.width + horizontalSpacing
        }
    }
}

struct DynamicGridView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                DynamicGrid(horizontalSpacing: 10, verticalSpacing: 10) {
                    Rectangle()
                        .foregroundColor(.brown)
                        .frame(width: 100, height: 50)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 20)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 100, height: 60)
                    Rectangle()
                        .foregroundColor(.brown)
                        .frame(width: 100, height: 50)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 250, height: 20)
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 100, height: 60)
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 50)
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 110)
                }
            }
            .padding()
        }
    }
}
