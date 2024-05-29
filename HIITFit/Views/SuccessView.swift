

import SwiftUI

struct SuccessView: View {

    @Binding var selectedTab: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
               Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                    .padding()
                Text("High Five!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("""
                     Good job completing all four exercises!
                     Remember tomorrow's another day. 
                     So east well and get some rest.
                     """)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            VStack{
                Spacer()
                Button("Continue!"){
                    selectedTab = 9
                    dismiss()
                }
                    .padding()
            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))

}
