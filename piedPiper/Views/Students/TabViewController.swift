//
//  TabViewController.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 30/03/23.
//

import SwiftUI

enum Menu: Int, CaseIterable, Identifiable {
    var id: Int {
        return self.rawValue
    }
    
    case day
    case week
    case month
    
    var localizedText: String {
        switch self {
        case .day:
            return "Goals"
        case .week:
            return "Feedbacks"
        case .month:
            return "Comments"
        }
    }
}

struct TabViewController: View {
    @State private var selectedMenu = Menu.day

    var body: some View {
        VStack{
            ActivityTabView(selectedMenu: $selectedMenu)
                .padding(.horizontal)
            TabView(selection: $selectedMenu) {
                List {
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                }
                    .tag(Menu.day)
                Text("test")
                    .tag(Menu.week)
                Text("Month Data")
                    .tag(Menu.month)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
        }

    }
}


struct ActivityTabPreference: PreferenceKey {
    typealias Value = [Int: CGRect]
    static var defaultValue: [Int: CGRect] = [:]
    
    static func reduce(value: inout [Int : CGRect], nextValue: () -> [Int : CGRect]) {
        value.merge(nextValue()) { (_, new) in new }
    }
}

struct ActivityTabView: View {
    private(set) var menus = Menu.allCases
    @Binding var selectedMenu: Menu
    @State private var tabRects: [Int: CGRect] = [:]
    @State private var tabSliderRect: CGRect = .zero
    @State private var newPosition: CGSize = .zero
    @State private var offset: CGSize = .zero
    @State private var isDragging = false
    
    var currentMenuOffset: CGFloat {
        let val = tabRects[selectedMenu.rawValue]?.origin.x ?? offset.width
        return val
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
    
            ZStack(alignment: .topLeading) {
                Color.blue
                    .frame(width: tabSliderRect.width, height: tabSliderRect.height)
                    .clipShape(Capsule())
                    .offset(x: isDragging ? offset.width : currentMenuOffset)
                    .gesture(
                        DragGesture(coordinateSpace: .named("myHstack"))
                            .onChanged { gesture in
                                isDragging = true
                                var newTranslation = gesture.translation
                                if isValidScroll(translation: newTranslation) {
                                    newTranslation.width += newPosition.width
                                    self.offset = newTranslation
                                }
                                
                                print("onChanged => self.offset", self.offset)
                                print("onChanged => gesture.translation", gesture.translation)
                            }
                            .onEnded { gesture in
                                if isValidScroll(translation: gesture.translation) {
                                    let threshold = tabSliderRect.width * CGFloat(selectedMenu.rawValue) + tabSliderRect.width / 2
                                    if self.offset.width > threshold {
                                        selectedMenu = Menu(rawValue: selectedMenu.rawValue + 1) ?? .day
                                    } else {
                                        selectedMenu = Menu(rawValue: selectedMenu.rawValue - 1) ?? .day
                                    }
                                    
                                    if let newRect = tabRects[selectedMenu.rawValue] {
                                        offset.width = newRect.origin.x
                                    }
                                    
                                    self.newPosition = offset
                                    
                                    print("onEnded => self.offset", self.offset)
                                    print("onEnded => gesture.translation", gesture.translation)
                                }
                                
                                isDragging = false
                            }
                    )
                
                
                HStack(spacing: 0) {
                    ForEach(menus, id: \.self) { menu in
                        Text(menu.localizedText)
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .foregroundColor((menu == selectedMenu ? Color.white : Color("Color").opacity(0.7)))
                            .frame(maxWidth: .infinity)
                            .allowsHitTesting(menu != selectedMenu)
                            .onTapGesture {
                                withAnimation {
                                    selectedMenu = menu
                                    if let newRect = tabRects[selectedMenu.rawValue] {
                                        offset.width = newRect.origin.x
                                    }
                                    
                                    self.newPosition = offset
                                }
                            }
                            .background(
                                GeometryReader { g in
                                    Color.clear
                                        .preference(key: ActivityTabPreference.self,
                                                    value: [menu.rawValue: g.frame(in: .named("myHstack"))])
                                }
                            )
                    }
                }
                .coordinateSpace(name: "myHstack")
                .background(Color.black.opacity(0.06).allowsHitTesting(false))
                .clipShape(Capsule())
                .onPreferenceChange(ActivityTabPreference.self) { value in
                    self.tabRects = value
                    if tabSliderRect == .zero, let newRect = self.tabRects[self.selectedMenu.rawValue] {
                        self.tabSliderRect = newRect
                    }
                }
            }
        }
    }
    
    func isValidScroll(translation: CGSize) -> Bool {
        var returnVal = true
        if selectedMenu.rawValue == 0, translation.width < 0 {
            print("can't scroll beyond 0")
            returnVal = false
        } else if selectedMenu.rawValue == menus.count - 1, translation.width > 0 {
            print("can't scroll above max")
            returnVal = false
        } else {
            returnVal = true
        }
        
        return returnVal
    }
}

struct ActivityTabPreferenceSetter: View {
    let menu: Menu
    var body: some View {
        GeometryReader { g in
            Color.clear
                .preference(key: ActivityTabPreference.self,
                            value: [menu.rawValue: g.frame(in: .named("myHstack"))])
        }
    }
}


struct TabViewController_Previews: PreviewProvider {
    static var previews: some View {
        TabViewController()
    }
}
