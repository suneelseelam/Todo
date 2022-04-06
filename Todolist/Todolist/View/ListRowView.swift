//
//  ListRowView.swift
//  Todolist
//
//  Created by suneel seelam on 22/03/22.
//

import SwiftUI

struct ListRowView: View {
	
	@State var item: ItemModel?
	
    var body: some View {
//		NavigationView {
		VStack(alignment: .leading, spacing: 6) {
			Text(item?.title ?? "")
				.font(.headline)
				.accessibilityLabel("Todo Item Title")
				.accessibilityValue(item?.description ?? "")
			Text(item?.description ?? "")
				.font(.subheadline)
				.accessibilityLabel("Todo Item Description")
				.accessibilityValue(item?.description ?? "")
		}
    }
//	}
}

//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView(item: ItemModel(title: "First", description: "description"))
//    }
//}
