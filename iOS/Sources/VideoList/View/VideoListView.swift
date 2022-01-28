//
//  VideoListView.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import Service

struct VideoListView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { q in
                        QueryTag(query: q, isSelected: false)
                    }
                }
                
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
