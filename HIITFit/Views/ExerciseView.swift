import SwiftUI
import AVKit

struct ExerciseView: View {

    var exercise: Exersice{
        Exersice.exersices[index]
    }

    let index: Int


    var body: some View {
        GeometryReader {geometry in
            VStack{
                HeaderView(exerciseName: exercise.exersiceName)
                    .padding(.bottom)

                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couln't find \(exercise.exersiceName).mp4")
                        .foregroundColor(.red)
                }

                Text("Timer")
                Text("Start/Done Button")
                Text("Rating")
                Text("History")
            }
        }

    }
}

#Preview {
    ExerciseView(index: 0)
}

