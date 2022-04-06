//
//  ListView.swift
//  Todolist
//
//  Created by suneel seelam on 22/03/22.
//

import SwiftUI

struct ListView: View {
	
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
	@State private var presentAddView: Bool = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(listViewModel.items) { item in
						NavigationLink {
							AddView(vm: listViewModel, itemModel: item)
						} label: {
							ListRowView(item: item)
					}
				}
				.onDelete(perform: listViewModel.deleteItem)
				.onMove(perform: listViewModel.moveItem)
			}
			.navigationTitle("Todo List")
			.sheet(isPresented: $presentAddView, content: {
				AddView(vm: listViewModel)
			})
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						presentAddView = true
					} label: {
						Image(systemName: "plus")
							.accessibilityLabel("Add Todo")
							.accessibilityAddTraits(.isButton)
							.accessibilityRemoveTraits(.isImage)
					}
				}
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				}
			}
		}
	}
}

struct ListView_Previews: PreviewProvider {
	
    static var previews: some View {
		NavigationView {
			ListView()
		}
//		.environmentObject(ListViewModel())
    }
}
