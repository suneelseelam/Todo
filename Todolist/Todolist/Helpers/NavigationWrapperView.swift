//
//  NavigationWrapperView.swift
//  DemoProject
//
//  Created by suneel seelam on 22/03/22.
//

import SwiftUI

struct NavigationWrapperView<Content: View>: View {
	
	let wrappedNavigation: Bool
	var content: ()-> Content
	
	init(wrappedNavigation: Bool, content: @escaping ()->Content) {
		self.wrappedNavigation = wrappedNavigation
		self.content = content
	}
	
	var body: some View {
		if wrappedNavigation {
			NavigationView {
				content()
			}
		}
		else {
			content()
	}
	}
}

struct NavigationWrapperView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationWrapperView(wrappedNavigation: false) {
			Text("Hello World")
		}
	}
}
