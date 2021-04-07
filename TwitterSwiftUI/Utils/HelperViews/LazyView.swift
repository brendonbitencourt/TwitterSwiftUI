//
//  LazyView.swift
//  TwitterSwiftUI
//
//  Created by Braga, Brendon on 07/04/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content){
        self.build = build
    }
    var body: Content {
        build()
    }
}
