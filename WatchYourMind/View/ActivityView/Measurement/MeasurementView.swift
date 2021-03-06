//
//  MeasurementView.swift
//  WatchYourMind
//
//  Created by Gatang on 16/3/2564 BE.
//

import SwiftUI
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
extension UIScreen{
   static let Widthscreen = UIScreen.main.bounds.size.width
   static let Heightscreen = UIScreen.main.bounds.size.height
   static let Sizescreen = UIScreen.main.bounds.size
}



struct MeasurementView: View {
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]

    var user: userRequest
    
    let prefeedback = UIImpactFeedbackGenerator(style: .heavy)
    @EnvironmentObject var homeView: HomeView
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    
    @State var showBanner:Bool = false
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)

    var body: some View {
        
        ZStack {
            
            if homeView.showingPage == false{

                    VStack{
                        NavigationBarMeasurement()

                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Image("\(user.imageUser)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .padding(.horizontal,8)
                                    .clipShape(Circle())
                                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                                    .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
                            }//:VSTACK
                                                .padding(.bottom,10)

                            VStack(alignment: .leading, spacing: 0){
                                HStack {
                                    Text("Appointment:")
                                    ParentDatePicker()
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name TH:")
                                    
                                    Text("\(user.nameTH)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Name EN:")
                                    
                                    Text("\(user.nameEN)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("E-mail:")
                                    
                                    Text("\(user.email)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Faculty:")
                                    
                                    Text("\(user.faculty)")
                                }.padding(.bottom,3)
                                HStack {
                                    Text("Branch:")
                                    
                                    Text("\(user.branch)")
                                        
                                }
                                .padding(.bottom,20)
//                                BottonSend()
//                                Button(action: {
//                                },label: {
//
//                                    ZStack {
//                                    HStack {
//                                        Text("SEND")
//                                        Image(systemName: "paperplane")
//
//                                    }
//                                    .padding(.horizontal,20)
//                                    .padding(10)
//                                    .background(Color.white)
//                                    .cornerRadius(5)
//                                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
//                                    .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
//                                    }
//                            .onTapGesture {
//                                      prefeedback.impactOccurred()
//                                        homeView.showingPage = true
//                                    }

//                                })//:BUTTON-SEND
                                
                                HStack {
                                  Button(action: {
                                    withAnimation(.easeIn) {
                                        prefeedback.impactOccurred()
                                        homeView.selectedPage = nil
                                        homeView.showingPage = false
                                    }
                                  }, label: {
                                    Image(systemName: "chevron.left")
                                      .font(.title)
                                      .foregroundColor(.white)
                                        .onTapGesture {
                                                                             prefeedback.impactOccurred()
                                                                               homeView.showingPage = true
                                                                           }
                                  })
                                  
                                  
//                                  Spacer()
                                } //: HSTACK
                                .padding()
                                .padding(.vertical,10)
                                .background(Color.purple)


//                               .banner(data: $bannerData, show: $showBanner)
                                
                            }//:VSTACK

                        }//:HSTACK

                        HStack{
                            VStack(alignment:.center) {
                                Text("ACTIVITY")
                                    .font(.system(size: 20))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            
                            }//:VSTACK
                            Text("(10)")
                                .foregroundColor(.gray)
                        } //: HSTACK
                        .frame(width: UIScreen.Widthscreen,height: 100 )
                        VStack(alignment:.leading){
                        ScrollView(.vertical, showsIndicators: false) {
                                FlipMeasureView()
                                    .frame(width: UIScreen.Widthscreen, height: UIScreen.Height, alignment: .center)
                            }//:ZStack
                            .padding()
                        }//VSTACK
                    }
            }//:IF
            else{
                HomeContentView( isAuthen: .constant(true), digit: .constant(10))
            }
        }//ZSTACK

          .edgesIgnoringSafeArea(.all)

        
    }
            
          
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView(user: userRequestData[1])
            .environmentObject(HomeView())
    }
}
//



struct sendButtonView: View {

  @Environment(\.presentationMode) private var presentationMode

  var body: some View {
    Group {
      Text("Modal view")
      Button(action: {
         self.presentationMode.wrappedValue.dismiss()
      }) {
        Text("Send")
      }
    }
  }
}
