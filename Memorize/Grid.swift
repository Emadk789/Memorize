//
//  Grid.swift
//  Memorize
//
//  Created by Emad Albarnawi on 27/09/2020.
//  Copyright © 2020 Emad Albarnawi. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    let items: [Item];
    let viewForItem: (Item) -> ItemView;
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items;
        self.viewForItem = viewForItem;
    }
    var body: some View {
        GeometryReader { geometry in
            ForEach(items) { item in
//                viewForItem(item);
                setLayout(for: item, geometryReader: geometry.size);
            }
        }
    }
    private func setLayout(for item: Item, geometryReader: CGSize) -> some View {
        let layout = getLayout(of: geometryReader);
//        guard let index = index(of: item) else { return }
        let index =  self.index(of: item) ?? -5;
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: self.index(of: item) ?? 0))
        
    }
    private func getLayout(of geometryReader: CGSize) -> GridLayout {
        return GridLayout(itemCount: items.count, in: geometryReader);
    }
    private func index(of value: Item) -> Int? {
        for (index, item) in items.enumerated() {
            if item.id == value.id {
                return index;
            }
            
        }
        return nil;
    }
}
//protocol Commen {
//    associatedtype Item;
//    associatedtype items: IntervalType
//    func index(of value: Item) -> Int?;
//}
//extension Commen {
//    func index(of value: Item) -> Int? {
//        for (index, item) in items.enumerated() {
//            return item.id == value.id ? index : nil;
//        }
//        return nil;
//    }
//}

