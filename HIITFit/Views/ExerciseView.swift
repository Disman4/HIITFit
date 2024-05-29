import SwiftUI
import AVKit

struct ExerciseView: View {

    @Binding var selectedTab: Int

    //computed property using Exercise type
    var exercise: Exercise{
        Exercise.exercises[index]
    }

    let index: Int

    //time interval for exercise timer (30 seconds)
    let interval: TimeInterval = 30

    var lastExercise: Bool{
        index + 1 == Exercise.exercises.count
    }

    var startButton: some View {
      Button("Start Exercise") { }
    }

    var doneButton: some View {
      Button("Done") {
        selectedTab = lastExercise ? 9 : selectedTab + 1
      }
    }

    var body: some View {
        GeometryReader {geometry in
            VStack{

                //Header
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName )
                    .padding(.bottom)


                //Video Player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)

                //timer
                Text(Date().addingTimeInterval(interval),style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))

                //button to start and stop

                HStack(spacing: 150){
                    startButton
                    doneButton
                        .font(.title3)
                        .padding()
                }



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
    ExerciseView(selectedTab: .constant(1), index: 1)
}

