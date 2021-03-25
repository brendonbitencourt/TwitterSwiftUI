//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
     
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell()
                        })
                    HStack { Spacer() }
                }
            }
            .padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
