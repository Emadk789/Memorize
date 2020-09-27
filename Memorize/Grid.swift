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
                viewForItem(item);
                setLayout(for: item, geometryReader: geometry.size);
            }
        }
    }
    func setLayout(for item: Item, geometryReader: CGSize) -> some View {
        let layout = getLayout(of: geometryReader);
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height);
    }
    func getLayout(of geometryReader: CGSize) -> GridLayout {
        return GridLayout(itemCount: items.count, in: geometryReader);
    }
}

