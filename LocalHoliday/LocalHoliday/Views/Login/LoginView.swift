//
//  LoginView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/07.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authData: AuthData
    @State private var loginCredentials: LoginCredentials = LoginCredentials(email: "", password: "")
    let repository = DefaultAuthRepository()
//    init() {
//
//    }
    var body: some View {
        VStack(spacing: Size.Outer) {
            Image.LocalHoliday
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            TextField("이메일을 입력해주세요", text: $loginCredentials.email)
                .textFieldStyle(.roundedBorder)
                .font(.B2R)
            
            SecureField("비밀번호를 입력해주세요", text: $loginCredentials.password)
                .textFieldStyle(.roundedBorder)
                .font(.B2R)
            
            Spacer()
            
            RoundedRectangleButton(text: "로그인") {
                repository.login(LoginCredentials(email: loginCredentials.email, password: loginCredentials.password))
                    .sink { completion in
                        switch completion {
                        case .failure(let error):
                            print("error! : \(error.localizedDescription)")
                        case .finished:
                            print("finished!")
                        }
                    } receiveValue: { result in
                        print("result : \(result)")
                        authData.loginInfo = result
                    }
                    .store(in: &repository.cancellables)
            }
            
            Spacer()
        }
        .padding(Size.Outer)

//        VStack {
//            if let info {
//                Text("token : \(info.token ?? "???")")
//            } else {
//                Button {
//                    login()
//                } label: {
//                    Text("로그인 버튼!")
//                }
//            }
//            Button {
//                get()
//            } label: {
//                Text("get 버튼!")
//            }
//        }
    }
    
//    private func login() {
//        guard let url = URL(string: "http://15.165.241.113:8081/signin") else {
//            return
//        }
//
//        // POST 요청에 필요한 데이터를 요청 본문에 추가
//        let parameters: [String: Any] = [
//            "email": "admin@google.com",
//            "password": "1234"
//        ]
//
//        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
//
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpBody = jsonData
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Info.self, from: data)
//                    print("response : \(response)")
//                    DispatchQueue.main.async {
//                        info = response
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error.localizedDescription)")
//                }
//            }
//        }
//        task.resume()
//    }
    
    private func get() {
        guard let url = URL(string: "http://15.165.241.113:8081/") else {
            return
        }
        
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6ImFjY2VzcyIsInVpZCI6IjRjMjRkOGJhLTYxMTctNGJlMC1hNzZkLTI4ZWJlOTkyNGIzMSIsImNsdCI6ImFwcCJ9.6eB6pYjmprPiDMc6EDD4QT7Wum3GOR1iBjPf8eAX++0", forHTTPHeaderField: "Authorization")
        
//        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                print("data : \(String(decoding: data, as: UTF8.self))")
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(In.self, from: data)
                    print("response : \(response)")
//                    DispatchQueue.main.async {
//                        info = response
//                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

struct Info: Codable {
    var token: String?
}

struct In: Codable {
    var id: String?
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthData())
    }
}
