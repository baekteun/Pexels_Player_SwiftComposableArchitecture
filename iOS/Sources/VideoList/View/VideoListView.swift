//
//  VideoListView.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import Service
import ComposableArchitecture

struct VideoListView: View {
    let store: Store<VideoListState, VideoListAction>
    
    struct ViewState: Equatable{
        var selectedQuery: Query
        var videos: [Video]
        
        init(state: VideoListState){
            self.selectedQuery = state.selectedQuery
            self.videos = state.videos
        }
    }
    
    enum ViewAction: Equatable {
        case onAppear
        case selectQuery(Query)
    }
    
    var body: some View {
        WithViewStore(store.scope(state: ViewState.init, action: VideoListAction.init)) { viewStore in
            NavigationView {
                VStack {
                    HStack {
                        ForEach(Query.allCases, id: \.self) { q in
                            QueryTag(query: q, isSelected: viewStore.selectedQuery == q)
                                .onTapGesture {
                                    viewStore.send(.selectQuery(q))
                                }
                        }
                    }
                    
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
        
    }
}

extension VideoListAction{
    init(action: VideoListView.ViewAction){
        switch action{
        case .onAppear:
            self = .onAppear
        case let .selectQuery(q):
            self = .selectTag(q)
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView(store:
                        Store(
                            initialState: VideoListState(),
                            reducer: videoListReducer,
                            environment: VideoListEnvironment(
                                pexelsClient: .live,
                                mainQueue: .main)
                        )
        )
    }
}
