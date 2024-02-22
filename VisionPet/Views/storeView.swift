//
//  storeView.swift
//  VisionPet
//
//  Created by Elisa Ding on 2024-02-22.
//
import SwiftUI

struct storeView: View {
    
    @State var selectedPage: Page?
    @State var showSidebar: NavigationSplitViewVisibility = .doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $showSidebar) {
            List {
                ForEach(Page.allCases) { page in
                    Button {
                        selectedPage = page
                    } label: {
                        Label {
                            Text(page.title)
                                .font(.title)
                        } icon: {
                            Image(systemName: page.symbolName)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .navigationSplitViewColumnWidth(ideal: 250)
            .navigationTitle("Store")
//            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                selectedPage = .skins
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "storefront.fill")
                        .imageScale(.large)
                }
            }
//            .toolbar {
//                ToolbarItem {
//                    Button(action: {
//                        if showSidebar == .doubleColumn {
//                            showSidebar = .detailOnly
//                        } else {
//                            showSidebar = .doubleColumn
//                        }
//                    }) {
//                        Text(showSidebar == .doubleColumn ? "Hide" : "Show")
//                    }
//                }
//            }
            
        } detail: {
            if let selectedPage {
                selectedPage.content
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("blah blah")
                            }) {
                                Image(systemName: "xmark")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .clipShape(Circle())
                        }
                    }
                    .navigationTitle(selectedPage.title)
                    
            }
        }
        .glassBackgroundEffect()
    }
}

#Preview {
    storeView()
}
