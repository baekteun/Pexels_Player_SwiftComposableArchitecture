//
//  VideoView.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import AVKit
import Service

struct VideoView: View {
    let store: Store<VideoState, VideoAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VideoPlayer(player: viewStore.player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewStore.send(.onAppear)
                }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(store:
                    Store(
                        initialState: VideoState(),
                        reducer: videoReducer,
                        environment: VideoEnvironment(
                            mainQueue: .main)
                    )
        )
    }
}
