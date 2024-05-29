
import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86500)
    let history = HistoryStore()
    @Binding var showHistory: Bool

    var body: some View {
        ZStack(alignment: .topTrailing){
            Button(action: { showHistory.toggle() }){
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding()
            }
            VStack{
                Text("History")
                    .font(.title)
                    .padding()
                Form{
                    ForEach(history.exerciseDays){day in
                        Section(
                            header:
                                Text(today.formatted(as: "MMM d"))
                                .font(.headline)) {
                                    ForEach(day.exercises, id: \.self) { exercise in
                                        Text(exercise)
                                    }
                                }
                        Section(
                            header:
                                Text(yesterday.formatted(as: "MMM d"))
                                .font(.headline)) {
                                    ForEach(day.exercises, id: \.self) { exercise in
                                        Text(exercise)
                                    }
                                }
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
}
