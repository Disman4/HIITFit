import SwiftUI
import AVKit

struct ExerciseView: View {

    //computed property using Exercise type
    var exercise: Exersice{
        Exersice.exersices[index]
    }

    let index: Int

    //time interval for exercise timer (30 seconds)
    let interval: TimeInterval = 30

    var body: some View {
        GeometryReader {geometry in
            VStack{

                //Header
                HeaderView(exerciseName: exercise.exersiceName)
                    .padding(.bottom)


                //Video Player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)

                //timer
                Text(Date().addingTimeInterval(interval),style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))

                //button to start and stop
                Button("Start/Done"){ }
                    .font(.title3)
                    .padding()



                RatingView()
                    .padding()

                Spacer()
                Button("History"){}
                    .padding(.bottom)
            }
        }

    }
}

#Preview {
    ExerciseView(index: 0)
}

