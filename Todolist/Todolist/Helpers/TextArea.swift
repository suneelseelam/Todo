//
//  TextArea.swift
//  Todolist
//
//  Created by suneel seelam on 25/03/22.
//

import SwiftUI

struct TextArea: View {
	
	let placeholder: String
	@Binding var text: String
	
	init(_ placeholder: String, text: Binding<String>) {
		self.placeholder = placeholder
		self._text = text
	}
	
    var body: some View {
		TextEditor(text: $text)
			.background(
				HStack(alignment: .top) {
					text.isEmpty ? Text(LocalizedStringKey(placeholder)) : Text("")
					Spacer()
				}
				.foregroundColor(Color.primary.opacity(0.25))
				.padding(EdgeInsets(top: 0, leading: 4, bottom: 7, trailing: 0))
			)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
		TextArea("Text", text: .constant(""))
    }
}
