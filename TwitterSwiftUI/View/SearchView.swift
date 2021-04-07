//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Brendon Bitencourt Braga on 2021-03-24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @EnvironmentObject var viewModel: SearchViewModel
     
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    NavigationLink(
                        destination: LazyView(UserProfileView()
                            .environmentObject(ProfileViewModel(user: user))),
                        label: {
                            UserCell(user: user)
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
            .environmentObject(SearchViewModel(withMOCK: true))
    }
}
