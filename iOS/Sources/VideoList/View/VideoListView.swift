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
        var isVideoViewActive: Bool
        
        init(state: VideoListState){
            self.selectedQuery = state.selectedQuery
            self.videos = state.videos
            self.isVideoViewActive = state.videoState != nil
        }
    }
    
    enum ViewAction: Equatable {
        case onAppear
        case selectQuery(Query)
        case videoCardDidTap(Video)
        case videoViewDismissed
    }
    
    var col = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
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
                    ScrollView {
                        if viewStore.videos.isEmpty {
                            ProgressView()
                        }
                        LazyVGrid(columns: col) {
                            ForEach(viewStore.videos) { item in
                                NavigationLink(
                                    destination: IfLetStore(
                                        self.store.scope(
                                            state: \.videoState,
                                            action: VideoListAction.videoView),
                                        then: VideoView.init(store:)),
                                    isActive: viewStore.binding(
                                        get: \.isVideoViewActive,
                                        send: { $0 ? .videoCardDidTap(item) : .videoViewDismissed } )
                                    ) {
                                        VideoCard(video: item)
                                    }
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                .background(Color("AccentColor"))
                .navigationBarHidden(true)
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
        case let .videoCardDidTap(video):
            self = .videoCardDidTap(video)
        case .onAppear:
            self = .onAppear
        case let .selectQuery(q):
            self = .selectTag(q)
        case .videoViewDismissed:
            self = .videoViewDismissed
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
