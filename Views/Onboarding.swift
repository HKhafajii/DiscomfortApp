import SwiftUI

struct Onboarding: View {
    
    @State var isAnimating = false
    @State var isAnimating2 = false
    @State var isAnimating3 = false
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                ZStack {
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("lightGray"))
                        .offset(x: -145, y: 110)
                        .opacity(isAnimating ? 1 : 0)
                        .overlay(
                            Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .offset(x: -145, y: 110)
                            .opacity(isAnimating ? 1 : 0)
                        )
                    
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("lightGray"))
                        .offset(x: -170, y: 175)
                        .opacity(isAnimating2 ? 1 : 0)
                        .overlay(
                            Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .offset(x: -170, y: 175)
                            .opacity(isAnimating2 ? 1 : 0)
                        )
                    
                    
                    VStack {
                        Text("Hi Welcome!\nThis app helps log emotions, our app uses research-based methods to give you a better way to express yourself in times of need.")
                            .padding()
                            .multilineTextAlignment(.center)
                            .opacity(isAnimating3 ? 1 : 0)
                        HStack{
                            NavigationLink("Go!") {
                                MainView()
                            }
                            
                        }
                        
                    }
                    
                    .background(Color("lightGray"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .opacity(isAnimating3 ? 1 : 0)
                    .padding()
                }
                Spacer()
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isAnimating2 = true
                    }
                    withAnimation(.easeInOut(duration: 2)) {
                        isAnimating3 = true
                    }
                }
                
            })
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .previewDevice("iPhone 14 Pro")
    }
}
