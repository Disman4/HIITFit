import SwiftUI

struct HeaderView: View {

    @Binding var selectedTab: Int
    let titleText: String

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self){ index in
                    let fill = index == selectedTab ? ".fill" : ""
                      Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}


#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "Sqaut")
        .previewLayout(.sizeThatFits)
}
