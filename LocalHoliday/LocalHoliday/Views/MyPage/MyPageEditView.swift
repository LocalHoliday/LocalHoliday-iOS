//
//  MyPageEditView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct MyPageEditView: View {
    @EnvironmentObject var authData: AuthData
    @State private var postedImage: Image? = .경기
    @State private var isWebViewLoading: Bool = false
    @State private var password: String = "********"
    @State private var isShowingConforming: Bool = false
    @State private var conformPassword: String = ""
    @State private var isConformed: Bool = true
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: Size.Inner) {
                HStack {
                    PhotosPickerView(postedImage: $postedImage) {
                        ZStack {
                            CircleImageView(id: 0, image: postedImage ?? .defaultUser)
                                .frame(width: Size.XXXXL)
                                .shadow(radius: 5)

                            Circle()
                                .fill(.white)
                                .frame(width: Size.L)
                                .shadow(radius: 5)
                                .overlay {
                                    Image(systemName: "camera")
                                        .renderingMode(Image.TemplateRenderingMode.original)
                                        .imageScale(.small)
                                        .foregroundColor(.black)
                                }
                                .offset(x: Size.XXL - Size.S, y: +Size.XXL - Size.S)
                        }
                    }
                    
                    Text("블랑사랑에디")
                        .font(.H4M)
                        .padding(Size.Inner)
                }
                .padding(Size.Inner)
                
                Rectangle()
                    .fill(Color.gray100)
                    .frame(height: Size.XS)
                
                VStack(alignment: .leading, spacing: Size.Inner) {
                    VStack(alignment: .leading, spacing: Size.Inner) {
                        HStack {
                            Text("회원 정보")
                                .font(.H4M)
                            Spacer()
                            Button {
                                print("수정")
                            } label: {
                                Text("수정")
                                    .font(.B1M)
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.Primary)
                        }
                        
                        Text("이름")
                            .font(.B1M)
                        
                        VStack {
                            TextField("이름을 적어주세요", text: self.$authData.user.name)
                                .font(.B2M)
                            Divider()
                        }
                        
                        Text("휴대폰 번호")
                            .font(.B1M)
                        
                        VStack {
                            TextField("휴대폰 번호를 적어주세요", text: self.$authData.user.phoneNumber)
                                .font(.B2M)
                            Divider()
                        }
                        
                        Text("사는 곳")
                            .font(.B1M)
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text(self.authData.user.location)
                                    .font(.B2M)
                                Divider()
                            }
                            NavigationLink {
                                WebView(delegate: WebViewDelegate(address: $authData.user.location, isLoading: $isWebViewLoading))
                                    .navigationBarBackButtonHidden()
                            } label: {
                                RoundedRectangle(cornerRadius: Radius.Small)
                                    .stroke(Color.Primary)
                                    .frame(width: Size.XXXXXL, height: Size.XXL)
                                    .overlay {
                                        Text("도로명 주소로 찾기")
                                            .font(.B4R)
                                    }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: Size.Inner) {
                        Text("비밀번호 \(isConformed ? "✅" : "❗️")")
                            .font(.B1M)
                            .animation(.spring(), value: isConformed)
                        
                        VStack {
                            SecureField("새로운 비밀번호를 적어주세요", text: self.$password)
                                .font(.B2M)
                                .onChange(of: self.password) { _ in
                                    self.isShowingConforming = true
                                    self.isConformed = false
                                }
                            Divider()
                            Group {
                                if isShowingConforming {
                                    SecureField("새로운 비밀번호를 다시 한번 더 적어주세요", text: self.$conformPassword)
                                        .font(.B2M)
                                        .onChange(of: self.conformPassword) { newValue in
                                            if newValue == self.password {
                                                isShowingConforming = false
                                                self.isConformed = true
                                                self.conformPassword = ""
                                            }
                                        }
                                        .animation(.spring(), value: self.conformPassword)
                                    Divider()
                                }
                            }
                            .animation(.spring(), value: self.isShowingConforming)
                        }
                        
                        Text("닉네임")
                            .font(.B1M)
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text(self.authData.user.location)
                                    .font(.B2M)
                                Divider()
                            }
                            Button {
                                print("중복확인")
                            } label: {
                                RoundedRectangle(cornerRadius: Radius.Small)
                                    .stroke(Color.Primary)
                                    .frame(width: Size.XXXXXL, height: Size.XXL)
                                    .overlay {
                                        Text("중복확인")
                                            .font(.B4R)
                                    }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(Size.Inner)
            }
        }
        .navigationTitle("내 정보 수정")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black, padding: 0)
            }
        }
    }
}

struct MyPageEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPageEditView()
                .environmentObject(AuthData())
        }
    }
}

import WebKit
import Combine


struct WebView: UIViewRepresentable {
    @Environment(\.dismiss) private var dismiss
    let urlString: String = "https://chongin12.github.io/Kakao_Postcode/"
    let delegate: WebViewDelegate
    
    func makeUIView(context: Context) -> WKWebView {
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "callBackHandler")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(delegate: delegate, dismiss: dismiss)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        
        let delegate: WebViewDelegate
        let dismiss: DismissAction
        
        init(delegate: WebViewDelegate, dismiss: DismissAction) {
            self.delegate = delegate
            self.dismiss = dismiss
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            delegate.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            delegate.isLoading = false
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if let data = message.body as? [String: Any] {
                delegate.address = data["roadAddress"] as? String ?? ""
            }
            dismiss()
        }
    }
}

class WebViewDelegate: ObservableObject {
    @Binding var address: String
    @Binding var isLoading: Bool
    
    init(address: Binding<String>, isLoading: Binding<Bool>) {
        self._address = address
        self._isLoading = isLoading
    }
}
