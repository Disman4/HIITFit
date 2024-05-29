import SwiftUI
import AVKit

struct ExerciseView: View {

    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false

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
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
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
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                        .font(.title3)
                        .padding()
                }



                RatingView(rating: $rating)
                    .padding()

                Spacer()
                Button("History"){
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                    .padding(.bottom)
            }
        }

    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
}

